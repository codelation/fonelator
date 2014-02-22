module Fonelator

  class Config
  
    class << self
      attr_accessor :user_class, :default_country_code, :default_area_code,
                    :twilio_account_sid, :twilio_auth_token, :twilio_number
    end
    
  end
  
end