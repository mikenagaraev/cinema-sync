App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    var chatBox = createMessageView(data);
    clearInput(data);
    scrollDown(data);

    return $("[data-chatroom='" + data.chatroom_id + "']").append(chatBox);
  }
});

function scrollDown(data) {
  var contentList = $("[data-chatroom='" + data.chatroom_id + "']");
  var numberOfMessages = $(contentList).find('.chat-box').length;
  $(contentList).animate({
    scrollTop: numberOfMessages * 200
  }, 500);
}

function scrollDownAll() {
  var contentList = $(".chat");
  console.log(contentList.length)
  $(contentList).each(function(i, data) {
    var numberOfMessages = $(data).find('.chat-box').length;
    console.log(numberOfMessages)
    $(data).animate({
      scrollTop: numberOfMessages * 200
    }, 500);
  })
}


function clearInput(data) {
  $("[data-message-room='" + data.chatroom_id + "'] form .message-content").val('');
}

function createMessageView(data) {
  var chatBox = $('<div/>').addClass("chat-box");
  var userBox = $('<div/>').addClass("user-box");
  var userName = $('<p/>').addClass("username-field").text(data.user);
  userBox.append($('<img class="user-img" src="/assets/user.png"/>'))
    .append(userName)
  var messageBox = $('<div/>').addClass('message-box')
  var messageField = $('<p/>').addClass('message-field').text(data.message)
  messageBox.append(messageField);

  chatBox.append(userBox).append(messageBox);
  return chatBox;
}

$(document).on('turbolinks:load', function() {
  scrollDownAll();
})
