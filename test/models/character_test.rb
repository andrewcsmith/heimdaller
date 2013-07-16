require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  
  # Verify that a character can be created
  def test_new_character_creation
    assert Character.new({name: "Valli Heimdaller", nickname: "Valli", level: 6}).valid?
  end
  
  # Verify that Valli exists
  def test_valli_existence
    assert_equal 16, characters(:valli).base_constitution
  end
  
  def test_that_name_is_required
    assert Character.create(name: nil, nickname: "Marty", level: 1).invalid?, "Nameless character is valid"
  end
  
  def test_that_level_is_required
    assert Character.create(name: "Martinich", nickname: "Marty", level: nil).invalid?, "Levelless character is valid"
  end
  
  def test_that_level_must_be_numeric
    assert Character.create(name: "Martinich", nickname: "Marty", level: "Magic").invalid?, "Test level character is valid"
  end
  
  def test_that_level_must_be_integer
    assert Character.create(name: "Martinich", nickname: "Marty", level: 2.6).invalid?, "Test float character is valid"
  end
  
  def test_that_level_must_be_greater_than_0
    assert Character.create(name: "Martinich", nickname: "Marty", level: -1).invalid?, "Level number out of range"
  end
  
  def test_that_nickname_is_required
    assert Character.create(name: "Martinich", nickname: nil, level: 1).invalid?, "Nicknameless character is valid"
  end
  
  # Verify that unspecified ability values default to 10
  def test_default_ability_values
    assert_equal 10, Character.new.base_wisdom
  end
  
  def test_save_presence
    assert_equal 2, characters(:valli).base_fortitude
    assert_equal 2, characters(:valli).base_reflex
    assert_equal 0, characters(:valli).base_will
  end
  
  def test_save_modifiers_presence
    assert_respond_to characters(:valli), :fortitude_magic_modifier
    assert_not_nil characters(:valli).fortitude_magic_modifier
  end
  
  # Verify that all save total scores function
  def test_default_save_totals
    assert_equal 5, characters(:valli).total_fortitude
    assert_equal 4, characters(:valli).total_reflex
    assert_equal 2, characters(:valli).total_will
  end
  
  # Verify that temporary save modifiers default to 0
  def test_save_modifiers_defaults
    assert_equal 0, characters(:valli).fortitude_magic_modifier
    assert_equal 0, characters(:valli).fortitude_miscellaneous_modifier
    assert_equal 0, characters(:valli).fortitude_temporary_modifier
    assert_equal 0, characters(:valli).reflex_magic_modifier
    assert_equal 0, characters(:valli).reflex_miscellaneous_modifier
    assert_equal 0, characters(:valli).reflex_temporary_modifier
    assert_equal 0, characters(:valli).will_magic_modifier
    assert_equal 0, characters(:valli).will_miscellaneous_modifier
    assert_equal 0, characters(:valli).will_temporary_modifier
  end
  
  # Verify that temporary save mods may be set
  def test_setting_save_modifiers
    characters(:valli).fortitude_magic_modifier = 2
    assert_equal 2, characters(:valli).fortitude_magic_modifier
  end
  
  # Verify that save totals reflect temporary modifiers
  def test_modified_save_totals
    characters(:valli).fortitude_magic_modifier = 2
    characters(:valli).fortitude_temporary_modifier = 1
    characters(:valli).fortitude_miscellaneous_modifier = 1
    assert_equal 9, characters(:valli).total_fortitude
  end
end
