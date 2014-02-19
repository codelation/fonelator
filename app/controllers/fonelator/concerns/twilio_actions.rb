module TwilioActions
  def twilio_voice
    if params[:AccountSID] == Fonelator.twilio_account_sid
      response = Twilio::TwiML::Response.new do |r|
        r.Dial do |d|
          d.Number ENV['TWILIO_FORWARD_NUMBER']
        end
      end
      render xml: response.text
    else
      raise AccountException, "Account SID didn't match the configured account."
    end
  end

  def twilio_sms

  end
end