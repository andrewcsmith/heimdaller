class Level < ActiveRecord::Base
	belongs_to :character
	validates :class_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
	validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :bab_bonus, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :fort_save_bonus, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :ref_save_bonus, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :will_save_bonus, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
