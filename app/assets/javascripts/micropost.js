function updateCountdown() {
  // 140 characters max
  var left = 140 - jQuery('#micropost_content').val().length;
  var char_str = " characters"
  var limit_str = " left."

  if (Math.abs(left) == 1) {
    char_str = " character"
  }
  if (left < 0) {
    jQuery('input.btn.btn-large.btn-primary').attr("disabled", "true")
    jQuery('.countdown').addClass("overlimit")
    limit_str = " too many."
  } else {
    jQuery('input.btn.btn-large.btn-primary').removeAttr("disabled")
    jQuery('.countdown').removeClass("overlimit")
  }
  jQuery('.countdown').text(Math.abs(left) + char_str + limit_str);
}

jQuery(document).ready(function($) {
  updateCountdown();
  $('#micropost_content').change(updateCountdown);
  $('#micropost_content').keyup(updateCountdown);
});