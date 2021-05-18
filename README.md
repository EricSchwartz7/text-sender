**Text Sender**

This app leverages Twilio and Rails to send SMS messages back and forth between browser and cell phone. It stores a record of every text sent and received.

Setup instructions
- Clone the repo
- `rake db:migrate`
- `bundle install`
- `rails s`
- Open a new terminal and run `./ngrok http 3000`
- Visit localhost:3000 in browser

A couple notes:
- Because I have a trial version of Twilio, this app will only work with my personal phone number.
- The trial version of ngrok requires me to reconfigure my Twilio account each time it starts up, otherwise it won't be able receive incoming texts.

Please reach out to me for any questions!
