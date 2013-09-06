class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :character_id

      t.timestamps
    end
  end
end
