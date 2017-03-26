$(document).on('turbolinks:load', function() {
  window.popupMessage = function(type, text) {
    var message = $('<div/>').addClass('popup-messages popup-messages-' + type)
    $(message).text(text);
    $(message).append('<div class="close-popup">☓</div>');
    $('body').append(message);
    $(message).fadeIn('slow');
    $(message).css('top', ($(window).height() - $(message).outerHeight()) / 2 + 'px');
    $(message).css('left', ($(window).width() - $(message).outerWidth()) / 2 + 'px');

    function windowClose() {
      $(message).fadeOut('slow');
    };
    setTimeout(function() {
      windowClose()
    }, 3000);
    $('.close-popup').click(function() {
      windowClose();
    });
  };
});
