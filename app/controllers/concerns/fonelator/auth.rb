module Fonelator
  module Auth
    extend ActiveSupport::Concern

    included do
      check_authorization
      rescue_from CanCan::AccessDenied do |exception|
        redirect_to main_app.root_url, alert: exception.message
      end
    end

    def fonelator_current_user
      respond_to?(:current_user) ? current_user : nil
    end

    def current_ability
      @current_ability ||= Fonelator::Ability.new(fonelator_current_user)
    end

  end
end
