class AddGenderToQuestionaries < ActiveRecord::Migration
  def change
    add_column :questionaries, :gender, :integer
  end
end
