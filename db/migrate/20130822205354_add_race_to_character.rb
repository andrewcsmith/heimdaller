class AddRaceToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :race, :string
  end
end
