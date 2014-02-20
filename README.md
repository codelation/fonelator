# Fonelator

Fonelator is a mountable `Rails::Engine` that adds webhooks for 
incoming and outgoing calls with [Twilio](https://www.twilio.com).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "fonelator", github: "81designs/fonelator"
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
Fonelator::Config.default_country_code = 1
Fonelator::Config.default_area_code    = 701
Fonelator::Config.twilio_auth_token    = "Twilio Auth Token"
Fonelator::Config.twilio_account_sid   = "Twilio Account SID"
Fonelator::Config.twilio_number        = "Twilio phone number"
```

Add the incoming voice webhook to your Twilio number:

> https://myapp.herokuapp.com/fonelator/webhooks/twilio_voice_in

Add the outgoing voice webhook to your Twilio SIP Domain:

> https://myapp.herokuapp.com/fonelator/webhooks/twilio_voice_out