class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.integer :conversation_id	  
      t.text :content
      t.datetime :created_at
	  t.integer :read
      t.timestamps null: false
    end
  end
end
