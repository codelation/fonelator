module Fonelator
  
  module TwilioActions
    extend ActiveSupport::Concern
    
    included do
      before_filter :twilio_verify_sid
      layout false
    end
    
    def twilio_voice_out
      @outgoing_number = twilio_outgoing_number
      @caller_id = Fonelator::Config.twilio_number
    end
    
  private
  
    def twilio_outgoing_number
      # Use the number dialed or the number entered after being prompted
      number = params[:Called].to_s.gsub(/\D/, "")
      if number.blank? && params[:Digits]
        number = params[:Digits].to_s.gsub(/\D/, "")
      end
      case number.length
      when "+#{Fonelator::Config.default_country_code}#{Fonelator::Config.default_area_code}3334444".length
        # +17013334444 -> +17013334444
        number
      when "#{Fonelator::Config.default_country_code}#{Fonelator::Config.default_area_code}3334444".length
        # 17013334444 -> +17013334444
        "+#{number}"
      when "#{Fonelator::Config.default_area_code}3334444".length
        # 7013334444 -> +17013334444
        "+#{Fonelator::Config.default_country_code}#{number}"
      when 7
        # 3334444 -> +17013334444
        "+#{Fonelator::Config.default_country_code}#{Fonelator::Config.default_area_code}#{number}"
      else
        nil
      end
    end
    
    def twilio_verify_sid
      if params[:AccountSid] != Fonelator::Config.twilio_account_sid
        raise "Account SID didn't match the configured account."
      end
    end
    
  end
  
end