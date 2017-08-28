$(document).on('turbolinks:load', function() {
  if (window.location.href.indexOf("sign_in") > -1) {
    $(".sign_in").addClass("active-registration-button");
    $(".sign_up").removeClass("active-registration-button");
  } else {
    $(".sign_up").addClass("active-registration-button");
    $(".sign_in").removeClass("active-registration-button");
  }
})
