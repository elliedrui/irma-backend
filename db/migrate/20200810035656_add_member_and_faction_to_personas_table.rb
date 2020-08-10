class AddMemberAndFactionToPersonasTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :personas, :member, foreign_key: true
    add_reference :personas, :faction, foreign_key: true
  end
end
