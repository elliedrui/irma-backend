class AddNotesToPersonas < ActiveRecord::Migration[6.0]
  def change
    add_column :personas, :notes, :text
  end
end
