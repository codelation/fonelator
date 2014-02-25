Fonelator::Engine.routes.draw do
  resources :webhooks do
    collection do
      post :twilio_dial_phones
      post :twilio_sms_in
      post :twilio_sms_out
      post :twilio_voice_in
      post :twilio_voice_out
    end
  end
  resources :extensions do
    get :autocomplete_fonelator_extension_name, :on => :collection
  end
  resources :phones
end
