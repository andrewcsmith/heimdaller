class MakeLevelsBelongToCharacter < ActiveRecord::Migration
  def change
    change_table(:levels) do |t|
      t.belongs_to :character
    end
  end
end
