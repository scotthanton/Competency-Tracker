class CreateDemandedSkills < ActiveRecord::Migration
  def change
    create_table :demanded_skills do |t|
      t.integer :user_id_employer
      t.integer :skill_id
      t.integer :level_id
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
