module Fonelator
  class Connection < ActiveRecord::Base
    belongs_to :extension
    belongs_to :phone
  end
end
