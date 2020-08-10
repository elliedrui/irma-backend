class AddPersonaToAddressesTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :persona, foreign_key: true
  end
end
