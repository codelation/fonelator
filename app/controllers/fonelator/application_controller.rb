module Fonelator
  class ApplicationController < ActionController::Base
    layout "fonelator/application"
    include Fonelator::Auth
  end
end
