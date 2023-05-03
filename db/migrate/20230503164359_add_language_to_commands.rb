class AddLanguageToCommands < ActiveRecord::Migration[6.1]
  def change
    add_column :commands, :language, :string
  end
end