# This migration comes from fonelator (originally 20140222212936)
class CreateFonelatorExtensions < ActiveRecord::Migration
  def change
    create_table :fonelator_extensions do |t|
      t.timestamps
    end
  end
end
