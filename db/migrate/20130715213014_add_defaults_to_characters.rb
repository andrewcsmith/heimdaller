class AddDefaultsToCharacters < ActiveRecord::Migration
  def up
    change_column :characters, :base_strength, :integer, default: 10
    change_column :characters, :base_dexterity, :integer, default: 10
    change_column :characters, :base_constitution, :integer, default: 10
    change_column :characters, :base_wisdom, :integer, default: 10
    change_column :characters, :base_charisma, :integer, default: 10
    change_column :characters, :base_intelligence, :integer, default: 10
    change_column :characters, :base_fortitude, :integer, default: 0
    change_column :characters, :base_reflex, :integer, default: 0
    change_column :characters, :base_will, :integer, default: 0
    change_column :characters, :base_attack_bonus, :integer, default: 0
    change_column :characters, :current_xp, :integer, default: 0
    change_column :characters, :current_money, :float, default: 0
    
    change_column :characters, :fortitude_magic_modifier, :integer, default: 0
    change_column :characters, :fortitude_miscellaneous_modifier, :integer, default: 0
    change_column :characters, :fortitude_temporary_modifier, :integer, default: 0
    change_column :characters, :reflex_magic_modifier, :integer, default: 0
    change_column :characters, :reflex_miscellaneous_modifier, :integer, default: 0
    change_column :characters, :reflex_temporary_modifier, :integer, default: 0
    change_column :characters, :will_magic_modifier, :integer, default: 0
    change_column :characters, :will_miscellaneous_modifier, :integer, default: 0
    change_column :characters, :will_temporary_modifier, :integer, default: 0
  end
  
  def down
    change_column :characters, :base_strength, :integer
    change_column :characters, :base_dexterity, :integer
    change_column :characters, :base_constitution, :integer
    change_column :characters, :base_wisdom, :integer
    change_column :characters, :base_charisma, :integer
    change_column :characters, :base_intelligence, :integer
    change_column :characters, :base_fortitude, :integer
    change_column :characters, :base_reflex, :integer
    change_column :characters, :base_will, :integer
    change_column :characters, :base_attack_bonus, :integer
    change_column :characters, :current_xp, :integer
    change_column :characters, :current_money, :float
    
    change_column :characters, :fortitude_magic_modifier, :integer
    change_column :characters, :fortitude_miscellaneous_modifier, :integer
    change_column :characters, :fortitude_temporary_modifier, :integer
    change_column :characters, :reflex_magic_modifier, :integer
    change_column :characters, :reflex_miscellaneous_modifier, :integer
    change_column :characters, :reflex_temporary_modifier, :integer
    change_column :characters, :will_magic_modifier, :integer
    change_column :characters, :will_miscellaneous_modifier, :integer
    change_column :characters, :will_temporary_modifier, :integer
  end
end
