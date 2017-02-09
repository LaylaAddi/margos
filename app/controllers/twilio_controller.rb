class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:voice]
  skip_before_action :authenticate_user!
  
  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say "Yay! You’re on Rails!", voice: "alice"
      r.Sms "Well done building your first Twilio on Rails 5 app!"
      r.Play "http://linode.rabasa.com/cantina.mp3"
    end
    render :xml => response.to_xml
  end
end