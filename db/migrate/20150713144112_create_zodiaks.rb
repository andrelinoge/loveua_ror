class CreateZodiaks < ActiveRecord::Migration
  def change
    create_table :zodiaks do |t|
      t.string :name
      t.string :css_class

      t.timestamps null: false
    end
  end
end
