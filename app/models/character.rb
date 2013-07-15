class Character < ActiveRecord::Base
  ABILITIES = %w{strength dexterity constitution intelligence wisdom charisma}
  # Generate the ability mod methods for each score:
  # :strength_modifier, :dexterity_modifier, etc.
  ABILITIES.each do |ability|
    define_method "#{ability}_modifier" do
      self.send("base_#{ability}") / 2 - 5
    end
  end
  
  SAVES = {:fortitude => :constitution, :reflex => :dexterity, :will => :wisdom}
  TEMP_TYPES = %w{magic miscellaneous temporary}
  # Create the variables for all modifiers
  SAVES.each do |save, ability|
    # Define the total score calculations for each save
    define_method "total_#{save}" do
      base = send "base_#{save}"
      ability_mod = send "#{ability}_modifier"
      magic_mod = send "#{save}_magic_modifier"
      misc_mod = send "#{save}_miscellaneous_modifier"
      temp_mod = send "#{save}_temporary_modifier"
      # puts "\n\nMODS: ab: #{ability_mod}\tmg: #{magic_mod}\tmc: #{misc_mod}\ttp:  #{temp_mod}\n\n"
      base + ability_mod + magic_mod + misc_mod + temp_mod
    end
  end
end
