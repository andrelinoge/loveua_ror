class City < ActiveRecord::Base
  belongs_to :region

  validates_presence_of :name
  validates_presence_of :region_id
end
