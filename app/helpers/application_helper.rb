module ApplicationHelper
  def send_sms message
@client = Twilio::REST::Client.new 

@client.account.messages.create(
      from: ENV['twilio_number'],
      to: message.number,
      body: message.text
)
  end

  def send_cable message
    html = render_message(message)

    ActionCable.server.broadcast 'messages',
      number: message.number,
      html: html
  end

  def render_message message
    ApplicationController.render({
      partial: 'messages/message',
      locals: { message: message }
    })
  end
  
  
  
  
  

  
  
end
