$(document).on('turbolinks:load', function() {

  function getRoomObject(dataArray) {
    var obj = {
      'room': {}
    };
    $(dataArray).each(function(i, data) {
      obj.room[$(data).attr('room-info')] = $(data).val();
    })
    return obj;
  }

  function getIncorrectInputs(inputs) {
    var incorrectInputs = [];

    $(inputs).each(function(i, input) {
      if (!$.trim($(input).val())) {
        incorrectInputs.push(input);
      }
    })

    return incorrectInputs;
  }

  function createRoom(data) {
    var sendable = getRoomObject(data);
    var controller = $('#create-room-button').attr('data-controller');
    console.log(sendable, controller)
    throughAJAX(sendable, controller, "POST", function() {
      popupMessage('success', 'Room is created');
    });
  }

  function closeModal(modal) {
    $(modal).find('input').each(function(i, el) {
      $(el).val('');
    });
    $(modal).modal('toggle');
  }

  $('#create-room-button').click(function(e) {
    e.preventDefault();

    var roomInputs = $('#create-room-pop-up input');
    var modal = $('#create-room-pop-up');

    var incorrectInputs = getIncorrectInputs(roomInputs);

    if (!incorrectInputs.length) {
      createRoom(roomInputs);
      closeModal(modal);
    } else {
      alertMessage('warning', 'Incorrect data', incorrectInputs, true);
    }
  })
})
