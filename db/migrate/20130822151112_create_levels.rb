class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :class_name
      t.integer :level
      t.integer :bab_bonus
      t.integer :fort_save_bonus
      t.integer :ref_save_bonus
      t.integer :will_save_bonus
      t.string :notes

      t.timestamps
    end
  end
end
