class CreateGuns < ActiveRecord::Migration[6.0]
  def change
    create_table :guns do |t|
      t.string :serial_number
      t.string :model
      t.string :description
      t.integer :persona_id

      t.timestamps
    end
  end
end
