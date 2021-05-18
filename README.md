**Text Sender**

This app leverages Twilio and Rails to send SMS messages back and forth between browser and cell phone. It stores a record of every text sent and received.

Setup instructions
- Clone the repo
- `rake db:migrate`
- `bundle install`
- `rails s`
- * Open a new terminal and run `./ngrok http 3000`
- Visit localhost:3000 in browser

* Because I have the trial version of ngrok, this step won't work at the moment. Please reach out to me for details.
