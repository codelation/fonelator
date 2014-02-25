module Fonelator
  class Extension < ActiveRecord::Base
    has_many :connections
    has_many :phones, through: :connections

    validates :name, presence: true
    validates :number, presence: true, uniqueness: true
  end
end
