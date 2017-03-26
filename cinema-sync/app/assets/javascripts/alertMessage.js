$(document).on('turbolinks:load', function() {
  window.alertMessage = function(type, text, elements, hasWrapper, time) {
    var defaultDelayTime = 3000;
    var message = $('<div/>').addClass('alert-messages alert-messages-' + type);

    message.text(text);

    if (hasWrapper) {
      elements.forEach(function(el, i) {
        elements[i] = $(el).closest('div');
      })
    }

    appendMessage(elements, message);
    $(message).show();

    if (!time) {
      $(message).show().delay(defaultDelayTime).fadeOut(function() {
        removeMessage(elements, message);
      });
    } else {
      $(message).show().delay(time).fadeOut(function() {
        removeMessage(elements, message);
      });
    }
  }

  function appendMessage(elements, message) {
    elements.forEach(function(el) {
      $(el).append(message);
      $(el).css('outline', 'none');
    })
  }

  function removeMessage(elements, message) {
    elements.forEach(function(el) {
      $(el).find(message).remove()
    })
  }

})
