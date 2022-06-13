class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :author
        
      t.integer :created_user_id
      t.integer :updated_user_id
      t.integer :deleted_user_id
      
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
    end
  end
end
