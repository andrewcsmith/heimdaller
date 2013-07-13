class AddStatsToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :base_strength, :integer
    add_column :characters, :base_dexterity, :integer
    add_column :characters, :base_constitution, :integer
    add_column :characters, :base_intelligence, :integer
    add_column :characters, :base_wisdom, :integer
    add_column :characters, :base_charisma, :integer
    
    add_column :characters, :max_hp, :integer
    add_column :characters, :current_hp, :integer
    
    add_column :characters, :base_fortitude, :integer
    add_column :characters, :base_reflex, :integer
    add_column :characters, :base_will, :integer
    
    add_column :characters, :base_speed, :integer
    add_column :characters, :base_attack_bonus, :integer
    
    add_column :characters, :current_xp, :integer
    add_column :characters, :current_money, :float
  end
end
