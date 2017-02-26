$(document).on('turbolinks:load', function() {
  window.throughAJAX = function(sendable, controller, method, callback) {
    $.ajax({
      data: sendable,
      url: controller,
      type: method,
      dataType: 'json'
    }).done(
      callback ? callback.call() : undefined
    )
  }
});
