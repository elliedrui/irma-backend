class CreatePersonas < ActiveRecord::Migration[6.0]
  def change
    create_table :personas do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :sex
      t.string :race
      t.integer :member_id
      t.integer :faction_id

      t.timestamps
    end
  end
end
