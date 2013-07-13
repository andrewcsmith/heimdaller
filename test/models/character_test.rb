require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  def setup
    @character = Character.new({
      :name => "Hello There",
      :base_strength => 12,
      :base_constitution => 14,
      :base_fortitude => 0,
      :base_reflex => 2,
      :base_will => 0
      })
  end
  
  def test_save_presence
    assert_equal 0, @character.base_fortitude
    assert_equal 2, @character.base_reflex
    assert_equal 0, @character.base_will
  end
  
  def test_save_modifiers_presence
    assert_respond_to @character, :fortitude_magic_modifier
    assert_not_nil @character.instance_variable_get(:@fortitude_magic_modifier)
  end
  
  def test_save_modifiers_defaults
    assert_equal 0, @character.fortitude_magic_modifier
    assert_equal 0, @character.fortitude_miscellaneous_modifier
    assert_equal 0, @character.fortitude_temporary_modifier
  end
  
  def test_setting_save_modifiers
    @character.fortitude_magic_modifier = 2
    assert_equal 2, @character.fortitude_magic_modifier
  end
  
  def test_default_save_totals
    assert_equal 2, @character.total_fortitude
  end
  
  def test_modified_save_totals
    @character.fortitude_magic_modifier = 2
    @character.fortitude_temporary_modifier = 1
    @character.fortitude_miscellaneous_modifier = 1
    assert_equal 6, @character.total_fortitude
  end
end
