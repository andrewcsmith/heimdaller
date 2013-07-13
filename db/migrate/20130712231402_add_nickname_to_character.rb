class AddNicknameToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :nickname, :string
  end
end
