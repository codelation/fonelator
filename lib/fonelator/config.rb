module Fonelator

  class Config
  
    class << self
      attr_accessor :default_country_code, :default_area_code,
                    :twilio_account_sid, :twilio_auth_token, :twilio_number,
                    :user_class
    end
    
  end
  
end