$(document).on('turbolinks:load', function() {
  $(".edit-sign").click(function(e) {
    var input = $("<input/>")
    input
      .addClass("edit-input")
      .val($.trim($(".room-page-header h2").text()));
    $(".room-page-header").prepend(input);
    $(".room-page-header h2").remove();
    $(".edit-sign").css("display", "none");
    showSubmit();
  })

  function showSubmit() {
    var editOk = $("<span/>").addClass("glyphicon-ok glyphicon edit-ok");
    $(editOk).click(function(e) {
      throughAJAX({
        room: {
          title: $.trim($(".edit-input").val())
        }
      }, $(".room-page-header").attr('controller'), "PUT", reset())
    })
    $(".room-page-header").append(editOk);
  }

  function reset() {
    var h2 = $("<h2/>")
    $(h2).text($(".edit-input").val());
    $(".room-page-header").prepend(h2);
    $(".edit-input").remove();
    $(".edit-ok").remove();
    $(".edit-sign").css("display", "inline-block");
  }
})
