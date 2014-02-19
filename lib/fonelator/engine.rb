require "fonelator/config"
require "fonelator/version"
require "twilio-ruby"

module Fonelator
  class Engine < ::Rails::Engine
    isolate_namespace Fonelator
  end
end
