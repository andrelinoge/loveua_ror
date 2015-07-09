class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :about
      t.references :mood
      t.references :zodiak
      t.text :interesting

      t.timestamps null: false
    end
  end
end
