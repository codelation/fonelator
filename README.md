# Fonelator

Fonelator is a mountable `Rails::Engine` that adds webhooks for 
incoming and outgoing calls with [Twilio](https://www.twilio.com). It is a **BYOU**(bring your own user) engine that allows users to add numbers at which they would like to be available and tag those numbers with extensions, so one extension can dial multiple numbers. This is great for having extensions for things like "sales", "engineering", and "support" where a number of individuals could pick up depending on who's free.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "fonelator", github: "codelation/fonelator"
```

Install Fonelator's neccessary migrations:

```bash
$ rake fonelator:install:migrations
$ rake db:migrate
```

Mount the engine in your Rails app:

```ruby
MyApp::Application.routes.draw do
  # ...
  mount Fonelator::Engine, at: "/fonelator"
  # ...
end
```

## Configuration

Create `config/initializers/fonelator.rb`:

```ruby
Fonelator::Config.default_country_code      = 1
Fonelator::Config.default_area_code         = 701
Fonelator::Config.default_forwarding_number = "Default forwarding number"
Fonelator::Config.default_forwarding_sip    = "Default forwarding SIP"
Fonelator::Config.twilio_auth_token         = "Twilio Auth Token"
Fonelator::Config.twilio_account_sid        = "Twilio Account SID"
Fonelator::Config.twilio_number             = "Twilio phone number"
Fonelator::Config.user_class                = "User"
```

Add the incoming voice webhook to your Twilio number:

> https://myapp.herokuapp.com/fonelator/webhooks/twilio_voice_in

Add the outgoing voice webhook to your Twilio SIP Domain:

> https://myapp.herokuapp.com/fonelator/webhooks/twilio_voice_out

## Routes

The following routes are added to the host application:

```bash
twilio_dial_phones_webhooks POST   /webhooks/twilio_dial_phones(.:format) fonelator/webhooks#twilio_dial_phones
     twilio_sms_in_webhooks POST   /webhooks/twilio_sms_in(.:format)      fonelator/webhooks#twilio_sms_in
    twilio_sms_out_webhooks POST   /webhooks/twilio_sms_out(.:format)     fonelator/webhooks#twilio_sms_out
   twilio_voice_in_webhooks POST   /webhooks/twilio_voice_in(.:format)    fonelator/webhooks#twilio_voice_in
  twilio_voice_out_webhooks POST   /webhooks/twilio_voice_out(.:format)   fonelator/webhooks#twilio_voice_out
                   webhooks GET    /webhooks(.:format)                    fonelator/webhooks#index
                            POST   /webhooks(.:format)                    fonelator/webhooks#create
                new_webhook GET    /webhooks/new(.:format)                fonelator/webhooks#new
               edit_webhook GET    /webhooks/:id/edit(.:format)           fonelator/webhooks#edit
                    webhook GET    /webhooks/:id(.:format)                fonelator/webhooks#show
                            PATCH  /webhooks/:id(.:format)                fonelator/webhooks#update
                            PUT    /webhooks/:id(.:format)                fonelator/webhooks#update
                            DELETE /webhooks/:id(.:format)                fonelator/webhooks#destroy
                 extensions GET    /extensions(.:format)                  fonelator/extensions#index
                            POST   /extensions(.:format)                  fonelator/extensions#create
              new_extension GET    /extensions/new(.:format)              fonelator/extensions#new
             edit_extension GET    /extensions/:id/edit(.:format)         fonelator/extensions#edit
                  extension GET    /extensions/:id(.:format)              fonelator/extensions#show
                            PATCH  /extensions/:id(.:format)              fonelator/extensions#update
                            PUT    /extensions/:id(.:format)              fonelator/extensions#update
                            DELETE /extensions/:id(.:format)              fonelator/extensions#destroy
                     phones GET    /phones(.:format)                      fonelator/phones#index
                            POST   /phones(.:format)                      fonelator/phones#create
                  new_phone GET    /phones/new(.:format)                  fonelator/phones#new
                 edit_phone GET    /phones/:id/edit(.:format)             fonelator/phones#edit
                      phone GET    /phones/:id(.:format)                  fonelator/phones#show
                            PATCH  /phones/:id(.:format)                  fonelator/phones#update
                            PUT    /phones/:id(.:format)                  fonelator/phones#update
                            DELETE /phones/:id(.:format)                  fonelator/phones#destroy
```
