class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :user_id_creator
      t.integer :user_id_recipient
      t.string :title
      t.text :content
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
