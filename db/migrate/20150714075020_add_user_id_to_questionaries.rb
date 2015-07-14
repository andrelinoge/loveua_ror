class AddUserIdToQuestionaries < ActiveRecord::Migration
  def change
    add_reference :questionaries, :user, index: true, foreign_key: true
  end
end
