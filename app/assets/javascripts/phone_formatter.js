function formatPhoneNumber(phoneNumberString) {
  var cleaned = ('' + phoneNumberString).replace(/\D/g, '');
  var match = cleaned.match(/^(\d{3})(\d{3})(\d{4})$/);
  if (match) {
    return '(' + match[1] + ') ' + match[2] + '-' + match[3];
  } else {
    return phoneNumberString
  }
}

$(document).on('turbolinks:load', () => {

    let hiddenPhoneField = $('#message_phone_number')
    let formattedPhoneField = $('#message_formatted_phone');

    formattedPhoneField.blur(event => {
      
      // validate

      hiddenPhoneField.val(parseInt(event.target.value));
      let formattedNumber = formatPhoneNumber(event.target.value);

      // Don't follow the link
      event.preventDefault();

      formattedPhoneField.val(formattedNumber);
  });
});
