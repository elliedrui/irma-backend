class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street_name
      t.integer :street_number
      t.integer :zip_code
      t.string :unit_type
      t.string :apt_number
      t.boolean :has_interior?
      t.integer :persona_id

      t.timestamps
    end
  end
end
