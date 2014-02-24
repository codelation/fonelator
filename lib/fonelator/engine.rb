require_relative "config"
require_relative "version"
require "cancan"
require "rails3-jquery-autocomplete"
require "jquery-ui-rails"

module Fonelator
  class Engine < ::Rails::Engine
    isolate_namespace Fonelator
  end
end
