class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
      t.integer :user_id
      t.integer :user_id_endorser
      t.integer :user_skill_assignments_id

      t.timestamps null: false
    end
  end
end
