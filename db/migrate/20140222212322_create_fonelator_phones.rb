class CreateFonelatorPhones < ActiveRecord::Migration
  def change
    create_table :fonelator_phones do |t|
      t.string :name
      t.string :number
      t.boolean :is_sip
      t.boolean :is_active
      t.belongs_to :extension, index: true

      t.timestamps
    end
  end
end
