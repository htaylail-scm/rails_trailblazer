class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :profile
      t.string :role
      t.string :phone
      t.string :address
      t.date :dob
      t.bigint :created_user_id
      t.bigint :updated_user_id
      t.integer :deleted_user_id

      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
    end
  end
end
