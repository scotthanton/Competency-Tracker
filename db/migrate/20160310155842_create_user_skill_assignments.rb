class CreateUserSkillAssignments < ActiveRecord::Migration
  def change
    create_table :user_skill_assignments do |t|
      t.integer :user_id
      t.integer :skill_id
      t.integer :level_id

      t.timestamps null: false
    end
  end
end
