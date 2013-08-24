class Relationship < ActiveRecord::Base
	belongs_to :character
	validates :level_id, presence: true
	validates :character_id, presence: true
end