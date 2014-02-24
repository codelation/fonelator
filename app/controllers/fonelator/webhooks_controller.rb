module Fonelator
  class WebhooksController < ApplicationController
    skip_authorization_check
    include TwilioActions
  end
end
