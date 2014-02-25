class AddNumberToExtension < ActiveRecord::Migration
  def change
    add_column :fonelator_extensions, :number, :integer
    add_index :fonelator_extensions, [:number], unique: true
  end
end
