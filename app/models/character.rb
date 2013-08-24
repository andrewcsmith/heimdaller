class Character < ActiveRecord::Base
  # Validates the presence of the three major items
  validates :name, presence: true
  validates :race, presence: true
  validates :alignment, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :nickname, presence: true
  has_many :levels, dependent: :destroy
  
  ABILITIES = %w{strength dexterity constitution intelligence wisdom charisma}
  # Generate the ability mod methods for each score:
  # :strength_modifier, :dexterity_modifier, etc.
  ABILITIES.each do |ability|
    define_method "#{ability}_modifier" do
      self.send("base_#{ability}") / 2 - 5
    end
    # Add validation to each ability score
    validates "base_#{ability}", numericality: { only_integer: true, greater_than: 0 }
  end
  
  SAVES = {:fortitude => :constitution, :reflex => :dexterity, :will => :wisdom}
  TEMP_TYPES = %w{magic miscellaneous temporary}
  # Create the variables for all modifiers
  SAVES.each do |save, ability|
    validates "base_#{save}", numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    TEMP_TYPES.each do |type|
      validates "#{save}_#{type}_modifier", numericality: { only_integer: true }
    end
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
