# Twilio SMS/MMS Broadcast

I originally built this app as "The Baby Broadcast System," a way to keep friends and family informed while my wife gives birth to our daughter. Turns out, an app to broadcast text and picture messages has all kinds of uses beyond those 24-48 hours.

There's a detailed blog post over on the Twilio blog on how I built this app. In short, it uses Google Spreadsheets as the CRUD layer for a phonebook. When a text comes into the app from your cellphone number, it forwards that message to everyone on the list. When a text comes in from someone else, it forwards the message to you and you only.

## Deploy to Heroku

If you'd like to deploy your own version of it with minimal fuss, click this button: 

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

After that, you'll need to:

* point the messaging webhook of a Twilio number at ```http://HEROKU_URL/message```.
* set an environment variable called MY_NUMBER (your cellphone)
* set an environment variable called SPREADSHEET_ID (your Google spreadsheet)

## Deploy locally

If you'd like to deploy this locally, clone the repo, then:

```
bundle install
export MY_NUMBER=+1312XXXXXXX
export SPREADSHEET_ID=YYYYYYYYYYYY
ruby broadcast.rb
```

You'll also need to open a tunnel to your local Sinatra server. I use [ngrok](http://ngrok.com) for this:

```
./ngrok -subdomain=example 4567
```

Then point the messaging webhook of a Twilio number at:

```
http://example.ngrok.com/messaging
```


