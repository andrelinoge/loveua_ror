class CreateQuestionaries < ActiveRecord::Migration
  def change
    create_table :questionaries do |t|
      t.integer :age
      t.integer :seek_gender
      t.integer :height
      t.integer :weight
      t.references :city
      t.references :region

      t.timestamps null: false
    end
  end
end
