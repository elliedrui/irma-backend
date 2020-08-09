class CreateFactions < ActiveRecord::Migration[6.0]
  def change
    create_table :factions do |t|
      t.string :name
      t.string :acronym
      t.string :faction_type

      t.timestamps
    end
  end
end
