class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :role
      t.integer :gender
      t.boolean :is_email_confirm
      t.string :avatar
      t.string :name

      t.timestamps null: false
    end
  end
end
