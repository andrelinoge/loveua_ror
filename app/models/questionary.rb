class Questionary < ActiveRecord::Base
  belongs_to :user

  belongs_to :city
  belongs_to :region

  def self.age_options
    (18..80).step(1).to_a.map{|age| ["#{age}", age]}
  end
end
