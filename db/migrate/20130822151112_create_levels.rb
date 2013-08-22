class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :class_name
      t.integer :level
      t.integer :bab
      t.integer :fort_save
      t.integer :ref_save
      t.integer :will_save
      t.string :notes

      t.timestamps
    end
  end
end
