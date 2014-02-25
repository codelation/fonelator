require_relative "config"
require_relative "version"
require "cancan"

module Fonelator
  class Engine < ::Rails::Engine
    isolate_namespace Fonelator
  end
end
