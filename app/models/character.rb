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
    TEMP_TYPES.each do |type|
      variable_string = "#{save}_#{type}_modifier"
      # instance_variable_set "@#{variable_string}"
      # Create getters
      define_method "#{variable_string}" do 
        instance_variable_get "@#{variable_string}"
      end
      define_method "#{variable_string}=" do |value|
        instance_variable_set "@#{variable_string}", value
      end
    end
    # Define the total score calculations
    define_method "total_#{save}" do
      base = send "base_#{save}"
      ability_mod = send "#{ability}_modifier"
      magic = send "#{save}_magic_modifier"
      misc = send "#{save}_miscellaneous_modifier"
      temp = send "#{save}_temporary_modifier"
      base + ability_mod + magic + misc + temp
    end
  end
  
  def initialize options
    super options
    SAVES.each do |save, ability|
      TEMP_TYPES.each do |type|
        # Set default values for the temporary modifier
        instance_variable_set "@#{save}_#{type}_modifier", 0
      end
    end
  end
end
