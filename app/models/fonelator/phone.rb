module Fonelator
  class Phone < ActiveRecord::Base
    belongs_to :extension
  end
end
