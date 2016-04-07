class CreatePrerequisites < ActiveRecord::Migration
  def change
    create_table :prerequisites do |t|
      t.integer :skill_id
      t.integer :level_id
      t.integer :prerequisite_skill_id
      t.integer :prerequisite_level_id
		
      t.timestamps null: false
    end
  end
end
