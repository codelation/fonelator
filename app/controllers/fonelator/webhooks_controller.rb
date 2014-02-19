require_relative 'concerns/twilio_actions'

module Fonelator
  class WebhooksController < ApplicationController
    include TwilioActions
  end
end
