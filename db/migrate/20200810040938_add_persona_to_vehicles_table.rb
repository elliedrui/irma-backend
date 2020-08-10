class AddPersonaToVehiclesTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :vehicles, :persona, foreign_key: true
  end
end
