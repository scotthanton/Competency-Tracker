class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.integer :skill_id
      t.text :description
      t.text :material_to_learn
      t.integer :level_id
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps null: false
    end
  end
end
