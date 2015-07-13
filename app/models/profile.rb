class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :zodiak
  belongs_to :mood
end
