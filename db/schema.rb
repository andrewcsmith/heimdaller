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

ActiveRecord::Schema.define(version: 20130822205354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: true do |t|
    t.string   "name"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "base_strength",                    default: 10
    t.integer  "base_dexterity",                   default: 10
    t.integer  "base_constitution",                default: 10
    t.integer  "base_intelligence",                default: 10
    t.integer  "base_wisdom",                      default: 10
    t.integer  "base_charisma",                    default: 10
    t.integer  "max_hp"
    t.integer  "current_hp"
    t.integer  "base_fortitude",                   default: 0
    t.integer  "base_reflex",                      default: 0
    t.integer  "base_will",                        default: 0
    t.integer  "base_speed"
    t.integer  "base_attack_bonus",                default: 0
    t.integer  "current_xp",                       default: 0
    t.float    "current_money",                    default: 0.0
    t.string   "nickname"
    t.integer  "fortitude_magic_modifier",         default: 0
    t.integer  "fortitude_miscellaneous_modifier", default: 0
    t.integer  "fortitude_temporary_modifier",     default: 0
    t.integer  "reflex_magic_modifier",            default: 0
    t.integer  "reflex_miscellaneous_modifier",    default: 0
    t.integer  "reflex_temporary_modifier",        default: 0
    t.integer  "will_magic_modifier",              default: 0
    t.integer  "will_miscellaneous_modifier",      default: 0
    t.integer  "will_temporary_modifier",          default: 0
    t.string   "race"
  end

  create_table "levels", force: true do |t|
    t.string   "class_name"
    t.integer  "level"
    t.integer  "bab"
    t.integer  "fort_save"
    t.integer  "ref_save"
    t.integer  "will_save"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
