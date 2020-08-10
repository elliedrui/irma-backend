class RemoveMemberIdAndFactionIdFromPersonasTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :personas, :member_id
    remove_column :personas, :faction_id
  end
end
