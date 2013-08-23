class Level < ActiveRecord::Base
	belongs_to :character
	validates :class_name, presence: true
	validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :bab, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :fort_save, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :ref_save, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :will_save, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	
	CORE_CLASSES = %w{Barbarian Bard Cleric Druid Fighter Monk Paladin Ranger Rogue Sorcerer Wizard}
	# Generate core class levels
	# Barbarian_lvl1 Barbarian_lvl2 ... Barbarian_lvl20, etc.
	CORE_CLASSES.each do |classs|
		for i in 1..20
			define_method "#{classs}_lvl"+i.to_s
		end
	end
end
