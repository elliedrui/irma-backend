class RemovePersonaIdFromVehiclesTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :vehicles, :persona_id
  end
end
