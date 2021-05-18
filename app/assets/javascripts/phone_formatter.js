
'use strict';

let formatPhoneNumber = numberString => {
  var cleaned = ('' + numberString).replace(/\D/g, '');
  var match = cleaned.match(/^(\d{3})(\d{3})(\d{4})$/);
  if (match) {
    return '(' + match[1] + ') ' + match[2] + '-' + match[3];
  } else {
    return numberString
  }
}

$(document).on('turbolinks:load', () => {

    let hiddenPhoneField = $('#message_phone_number')
    let formattedPhoneField = $('#message_formatted_phone');

    formattedPhoneField.blur(event => {
      let numberString = event.target.value;

      hiddenPhoneField.val(parseInt(numberString));
      let formattedNumber = formatPhoneNumber(numberString);

      // Don't follow the link
      event.preventDefault();

      formattedPhoneField.val(formattedNumber);
  });
});
