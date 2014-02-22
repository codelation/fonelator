module Fonelator
  class Extension < ActiveRecord::Base
    has_many :phones
  end
end
