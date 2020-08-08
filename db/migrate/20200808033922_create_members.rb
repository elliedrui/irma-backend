class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.integer :admin_level
      t.string :password_digest
      t.string :uid

      t.timestamps
    end
  end
end
