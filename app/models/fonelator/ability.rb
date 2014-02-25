module Fonelator
  class Ability
    include CanCan::Ability

    def initialize(user)
      if user
        can :manage, Fonelator::Extension
        can :manage, Fonelator::Phone
      end
    end
  end
end