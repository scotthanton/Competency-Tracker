class CreateSkillLevels < ActiveRecord::Migration
  def change
    create_table :skill_levels do |t|
      t.string :level
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
