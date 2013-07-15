# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130715211528) do

  create_table "characters", force: true do |t|
    t.string   "name"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "base_strength"
    t.integer  "base_dexterity"
    t.integer  "base_constitution"
    t.integer  "base_intelligence"
    t.integer  "base_wisdom"
    t.integer  "base_charisma"
    t.integer  "max_hp"
    t.integer  "current_hp"
    t.integer  "base_fortitude"
    t.integer  "base_reflex"
    t.integer  "base_will"
    t.integer  "base_speed"
    t.integer  "base_attack_bonus"
    t.integer  "current_xp"
    t.float    "current_money"
    t.string   "nickname"
    t.integer  "fortitude_magic_modifier"
    t.integer  "fortitude_miscellaneous_modifier"
    t.integer  "fortitude_temporary_modifier"
    t.integer  "reflex_magic_modifier"
    t.integer  "reflex_miscellaneous_modifier"
    t.integer  "reflex_temporary_modifier"
    t.integer  "will_magic_modifier"
    t.integer  "will_miscellaneous_modifier"
    t.integer  "will_temporary_modifier"
  end

end
