// function formatPhoneNumber(phoneNumberString) {
//     var cleaned = ('' + phoneNumberString).replace(/\D/g, '');
//     var match = cleaned.match(/^(\d{3})(\d{3})(\d{4})$/);
//     if (match) {
//       return '(' + match[1] + ') ' + match[2] + '-' + match[3];
//     }
//     return null;
//   }

// window.addEventListener('load', function () {

//     let phoneField = document.querySelector('#message_phone_number');

//     phoneField.addEventListener('blur', event => {

//         // alert("Phone input blurred")
//         let formattedNumber = formatPhoneNumber(event.target.value);

//         // Don't follow the link
//         event.preventDefault();

//         phoneField.value = formattedNumber;
//     }, false);

// });
