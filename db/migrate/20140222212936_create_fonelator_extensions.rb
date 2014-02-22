class CreateFonelatorExtensions < ActiveRecord::Migration
  def change
    create_table :fonelator_extensions do |t|
      t.timestamps
    end
  end
end
