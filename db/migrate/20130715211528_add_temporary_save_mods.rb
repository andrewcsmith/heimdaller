class AddTemporarySaveMods < ActiveRecord::Migration
  def change
    change_table :characters do |t|
      t.integer :fortitude_magic_modifier
      t.integer :fortitude_miscellaneous_modifier
      t.integer :fortitude_temporary_modifier
      t.integer :reflex_magic_modifier
      t.integer :reflex_miscellaneous_modifier
      t.integer :reflex_temporary_modifier
      t.integer :will_magic_modifier
      t.integer :will_miscellaneous_modifier
      t.integer :will_temporary_modifier
    end
  end
end
