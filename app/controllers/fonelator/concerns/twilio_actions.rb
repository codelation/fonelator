module Fonelator
  
  module TwilioActions
    
    class AccountException < Exception
    end
    
    def twilio_voice
      if params[:AccountSid] == Fonelator::Config::twilio_account_sid
        render layout: false
      else
        raise AccountException, "Account SID didn't match the configured account."
      end
    end

    def twilio_sms

    end
    
  end
  
end