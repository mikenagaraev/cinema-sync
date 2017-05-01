$(document).on('turbolinks:load', function() {

  var interval = 5000;

  setInterval(getVideoSyncronization, interval);

  function getVideoSyncronization() {
    var videoBlock = $("[data-video]");
    $.get()
  }
})
