# require 'test_helper'
require 'minitest/autorun'

class LevelTest < ActiveSupport::TestCase

	def test_that_class_name_is_required
		assert Level.create({class_name: nil, level: 1, bab_bonus: 1, 
			fort_save_bonus: 1, ref_save_bonus: 1, will_save_bonus: 1}).invalid?, 
			"Level requires no class name."
	end

	def test_that_class_name_is_string_only
		assert Level.create({class_name: 1, level: 1, bab_bonus: 1, 
			fort_save_bonus: 1, ref_save_bonus: 1, will_save_bonus: 1}).invalid?, 
			"Non-string class_name is valid."
	end

	def test_that_level_is_required
		assert Level.create({class_name: "Barbarian", level: nil, bab_bonus: 1, 
			fort_save_bonus: 1, ref_save_bonus: 1, will_save_bonus: 1}).invalid?, 
			"Level-less level is valid."	
	end

	def test_that_level_is_integer_only
		assert Level.create({class_name: "Barbarian", level: 1.1, bab_bonus: 1, 
			fort_save_bonus: 1, ref_save_bonus: 1, will_save_bonus: 1}).invalid?, 
			"non integer level is valid."
	end	

	def test_that_level_is_numeric_only
		assert Level.create({class_name: "Barbarian", level: 'str', bab_bonus: 1, 
			fort_save_bonus: 1, ref_save_bonus: 1, will_save_bonus: 1}).invalid?, 
			"non numeric level is valid."		
	end

	def test_that_bab_bonus_is_required
		assert Level.create({class_name: "Barbarian", level: 1, bab_bonus: nil, 
			fort_save_bonus: 1, ref_save_bonus: 1, will_save_bonus: 1}).invalid?, 
			"BAB_bonus-less level is valid."
	end

	def test_that_bab_bonus_is_integer_only
		assert Level.create({class_name: "Barbarian", level: 1, bab_bonus: 1.1, 
			fort_save_bonus: 1, ref_save_bonus: 1, will_save_bonus: 1}).invalid?, 
			"non integer bab_bonus is valid."
	end

	def test_that_level_is_numeric_only
		assert Level.create({class_name: "Barbarian", level: 1, bab_bonus: 'str', 
			fort_save_bonus: 1, ref_save_bonus: 1, will_save_bonus: 1}).invalid?, 
			"non numeric level is valid."		
	end

	def test_that_fort_save_bonus_is_required
		assert Level.create({class_name: "Barbarian", level: 1, bab_bonus: 1, 
			fort_save_bonus: nil, ref_save_bonus: 1, will_save_bonus: 1}).invalid?, 
			"fort_save_bonus-less level is valid."
	end

	def test_that_fort_save_bonus_is_integer_only
		assert Level.create({class_name: "Barbarian", level: 1, bab_bonus: 1, 
			fort_save_bonus: 1.1, ref_save_bonus: 1, will_save_bonus: 1}).invalid?, 
			"non integer fort_save_bonus is valid."
	end

	def test_that_fort_save_bonus_is_numeric_only
		assert Level.create({class_name: "Barbarian", level: 1, bab_bonus: 1, 
			fort_save_bonus: 'str', ref_save_bonus: 1, will_save_bonus: 1}).invalid?, 
			"non numeric level is valid."		
	end

	def test_that_ref_save_bonus_is_required
		assert Level.create({class_name: "Barbarian", level: 1, bab_bonus: 1, 
			fort_save_bonus: 1, ref_save_bonus: nil, will_save_bonus: 1}).invalid?, 
			"ref_save_bonus-less level is valid."
	end

	def test_that_ref_save_bonus_is_integer_only
		assert Level.create({class_name: "Barbarian", level: 1, bab_bonus: 1, 
			fort_save_bonus: 1, ref_save_bonus: 1.1, will_save_bonus: 1}).invalid?, 
			"non integer ref_save_bonus is valid."
	end

	def test_that_ref_save_bonus_is_numeric_only
		assert Level.create({class_name: "Barbarian", level: 1, bab_bonus: 1, 
			fort_save_bonus: 1, ref_save_bonus: "str", will_save_bonus: 1}).invalid?, 
			"non numeric level is valid."		
	end

	def test_that_will_save_bonus_is_required
		assert Level.create({class_name: "Barbarian", level: 1, bab_bonus: 1, 
			fort_save_bonus: 1, ref_save_bonus: 1, will_save_bonus: nil}).invalid?, 
			"will_save_bonus-less level is valid."
	end

	def test_that_will_save_bonus_is_integer_only
		assert Level.create({class_name: "Barbarian", level: 1, bab_bonus: 1, 
			fort_save_bonus: 1, ref_save_bonus: 1, will_save_bonus: 1.1}).invalid?, 
			"non integer will_save_bonus is valid."
	end

	def test_that_will_save_bonus_is_numeric_only
		assert Level.create({class_name: "Barbarian", level: 1, bab_bonus: 1, 
			fort_save_bonus: 1, ref_save_bonus: 1, will_save_bonus: "str"}).invalid?, 
			"non numeric level is valid."		
	end


end



