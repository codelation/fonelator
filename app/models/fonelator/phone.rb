module Fonelator
  class Phone < ActiveRecord::Base
    has_many :connections
    has_many :extensions, through: :connections
    belongs_to :user, class_name: Fonelator::Config.user_class

    validates_associated :user
    validates :name, presence: true
    validates :number, presence: true, uniqueness: true, numericality: true, length: { is: 11 }
  end
end
