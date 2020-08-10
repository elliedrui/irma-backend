class RemovePersonaIdFromGunsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :guns, :persona_id
  end
end
