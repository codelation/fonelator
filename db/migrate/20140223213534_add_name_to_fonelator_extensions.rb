class AddNameToFonelatorExtensions < ActiveRecord::Migration
  def change
    change_table :fonelator_phones do |t|
      t.belongs_to :user, index: true
      t.remove :extension_id
    end
    change_table :fonelator_extensions do |t|
      t.string :name
      t.boolean :is_listed
    end
  end
end
