class RemovePersonaIdFromAddressesTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :persona_id
  end
end
