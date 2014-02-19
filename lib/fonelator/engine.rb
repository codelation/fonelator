require "fonelator/config"
require "fonelator/version"

module Fonelator
  class Engine < ::Rails::Engine
    isolate_namespace Fonelator
  end
end
