module Fonelator
  
  module TwilioActions
    extend ActiveSupport::Concern
    
    included do
      before_filter :twilio_verify_sid
      layout false
    end
    
    def twilio_voice_out
      @outgoing_number = twilio_outgoing_number
    end
    
  private
  
    def twilio_outgoing_number
      # Use the number dialed or the number entered after being prompted
      number = params[:Called].to_s.gsub(/\D/, "")
      if number.blank? && params[:Digits]
        number = params[:Digits].to_s.gsub(/\D/, "")
      end
      case number.length
      when 12 # +17013334444 -> +17013334444
        number
      when 11 #  17013334444 -> +17013334444
        "+#{number}"
      when 10 #   7013334444 -> +17013334444
        "+1#{number}"
      when 7  #      3334444 -> +17013334444
        "+1701#{number}"
      else
        nil
      end
    end
  
    def twilio_verify_sid
      if params[:AccountSid] != Fonelator::Config::twilio_account_sid
        raise "Account SID didn't match the configured account."
      end
    end
    
  end
  
end