class Character < ActiveRecord::Base
  # Validates the presence of the five major items
  validates :name, presence: true
  validates :race, presence: true
  validates :alignment, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :nickname, presence: true
  has_many :relationships, foreign_key: "character_id", dependent: :destroy
  has_many :levels, through: :relationships
  
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
  
  SAVES = { :fortitude => :constitution, :reflex => :dexterity, :will => :wisdom }
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

  def add_level(char_class_to_lvl)
    char_class_to_lvl = char_class_to_lvl.capitalize.to_s # ensure request is in correct format
    # information we have: character to level, requested class to level
    @req_class = Level.find_by(class_name: char_class_to_lvl)
    if relationships.empty?
      relationships.create(level_id: @req_class.id)
    else
      # First, check if char already has level(s) in requested class
      relationships.each do |relationship|
        @rel_class = Level.find_by(id: relationship.level_id)
        # @class corresponds to instance of the Level model pointed to by relationship.
        # from here, we can get class_name and integer level
        if @rel_class.class_name == char_class_to_lvl
          # if this is the case, increase rank, don't add new class
          if @rel_class.level < 20
            puts 'class level < 20. adding level to requested class'
            # If class is not max level, destroy current rank and create next rank
            relationships.delete(Relationship.find(relationship.id))
            relationships.create(level_id: Level.find(relationship.level_id+1).id)
          else
            # prompt max level and ask for a different class to level
            # this functionality will likely end up in a different place
            puts "That class is already max level"
          end
        else
          # if not, add new class
          puts 'adding first level of requested novel class'
          relationships.create(level_id: @req_class.id)
        end
      end
    end
    relationships.each do |r|
      puts r.level_id
    end
  end

  def char_level
    lvl = 0
    relationships.each do |relationship|
      lvl += Level.find_by(id: relationship.level_id).level
    end    
    return lvl
  end
end
