require 'sinatra'
require 'twilio-ruby'

TWILIO_PHONE = '+15204473254'

numbers_and_names = {
  '13172221111' => 'Mom',
  '13122223333' => 'Dad'
}

post '/sms' do
  from_number = params['From']
  body = params['Body']
  media_url = params['MediaUrl0']

  content_type 'text/xml'
  xml = "<Response>"
  numbers_and_names.keys.each do |number|
    xml += "<Message to=\"#{number}\" from=\"#{TWILIO_PHONE}\">"
    xml += "<Body>#{body}</Body>"
    xml += "</Message>"
  end
  xml += "</Response>"
end


