class CreatePrerequisits < ActiveRecord::Migration
  def change
    create_table :prerequisits do |t|
      t.integer :skill_id
      t.integer :prerequisit_skill_id

      t.timestamps null: false
    end
  end
end
