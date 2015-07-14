class Region < ActiveRecord::Base
  has_many :city

  validates_presence_of :name
end
