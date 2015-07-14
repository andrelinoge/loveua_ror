class Questionary < ActiveRecord::Base
  belongs_to :user

  belongs_to :city
  belongs_to :region
end
