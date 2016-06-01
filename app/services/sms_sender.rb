require 'twilio-ruby'

class SmsSender
 def client
   @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
 end

 def send_message(from, to, body)
   client.account.messages.create(from: from, to: to, body: body)
 end
end
