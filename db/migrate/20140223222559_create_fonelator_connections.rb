class CreateFonelatorConnections < ActiveRecord::Migration
  def change
    create_table :fonelator_connections do |t|
      t.belongs_to :phone, index: true
      t.belongs_to :extension, index: true

      t.timestamps
    end
  end
end
