class Level < ActiveRecord::Base
	belongs_to :character
	validates :class_name, presence: true
	validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :bab, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :fort_save, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :ref_save, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :will_save, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
