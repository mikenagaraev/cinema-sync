$(document).on('turbolinks:load', function() {

  var player;
  var VIDEO_ID;
  var ROOM_ID;
  var IS_PLAYING;
  var TIME;
  var IS_OWNER;
  var previousPage;
  var currentPage;

  currentPage = window.location.href;

  if (localStorage.getItem("prevPage") != currentPage) {
    localStorage.setItem("prevPage", currentPage);
    window.location.reload();
  }

  onYouTubeIframeAPIReady();
  superUpdate();

  function init() {
    var tag = document.createElement('script');

    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    if (firstScriptTag.src == "https://www.youtube.com/iframe_api") {
      return;
    }
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
  }


  function superUpdate() {
    if (window.location.href.indexOf("room") > -1) {
      var interval = 5000;
      setTimeout(superUpdate, interval);
      $.get()
    }
  }


  function onYouTubeIframeAPIReady() {
    if (player) {
      return;
    }
    if ((typeof YT !== "undefined") && YT && YT.Player && VIDEO_ID) {
      player = new YT.Player('player', {
        height: '100%',
        width: '100%',
        videoId: VIDEO_ID,
        events: {
          'onReady': onPlayerReady,
          'onStateChange': onPlayerStateChange
        }
      });
    } else {
      init();
      setTimeout(onYouTubeIframeAPIReady, 100);
    }
  }

  function onPlayerReady(event) {
    if (IS_PLAYING) {
      event.target.playVideo();
    } else {
      event.target.stopVideo();
    }
    player.seekTo(TIME);
  }

  function onPlayerStateChange(event) {
    getVideoDuration()
  }

  function getVideoDuration() {
    var time = Math.round(player.getCurrentTime());
    var state = player.getPlayerState();
    IS_OWNER = $('#video-room-' + ROOM_ID).attr('isOwner');
    if (IS_OWNER) {
      throughAJAX({
        video: {
          start: state == 1 ? true : false,
          time: time
        }
      }, $('#video-room-' + ROOM_ID).attr('controller'), "PUT")
      if (state == 1) {
        setTimeout(getVideoDuration, 5000)
      }
    }
  }

  function checkSyncronization() {
    if (player) {
      if (Math.round(player.getCurrentTime()) + 5 < TIME || Math.round(player.getCurrentTime()) - 5 > TIME) {
        player.seekTo(TIME);
      }
      if (IS_PLAYING) {
        player.playVideo()
      } else {
        player.pauseVideo();
      }
    }
  }

  function stopVideo() {
    player.pauseVideo();
  }

  App.videos = App.cable.subscriptions.create('VideosChannel', {
    received: function(data) {
      ROOM_ID = data.room_id;
      VIDEO_ID = data.video_id.slice(-11, data.video_id.length)
      TIME = data.time;
      IS_PLAYING = data.start;
      checkSyncronization();
    }
  })
})
