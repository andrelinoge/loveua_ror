class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :user
      t.string :file
      t.boolean :is_avatar

      t.timestamps null: false
    end
  end
end
