Fonelator::Engine.routes.draw do
  post 'webhooks/twilio_voice', to: 'webhooks#twilio_voice'
end
