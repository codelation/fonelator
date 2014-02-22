Fonelator::Engine.routes.draw do
  root 'dashboard#index'
  resources :webhooks do
    collection do
      post :twilio_dial_extension
      post :twilio_sms_in
      post :twilio_sms_out
      post :twilio_voice_in
      post :twilio_voice_out
    end
  end
end
