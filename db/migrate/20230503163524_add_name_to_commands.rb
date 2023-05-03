class AddNameToCommands < ActiveRecord::Migration[6.1]
  def change
    add_column :commands, :name, :string
  end
end
