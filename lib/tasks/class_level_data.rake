namespace :db do 
	desc "Fill DB rows with class/level combinations"
	task populate_classes: :environment do
		CORE_CLASSES = %w{Barbarian Bard Cleric Druid Fighter Monk Paladin Ranger Rogue Sorcerer Wizard}
		# Generate core class levels
		# Barbarian_lvl1 Barbarian_lvl2 ... Barbarian_lvl20, etc.
		CORE_CLASSES.each do |classs|
			for i in 1..20
				Level.create(class_name: "#{classs}", level: i, bab_bonus: 0, fort_save_bonus: 0,
					ref_save_bonus: 0, will_save_bonus: 0)
				# define_method "#{classs}_lvl"+i.to_s
			end
		end
	end
end