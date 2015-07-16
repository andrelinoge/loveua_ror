class Questionary < ActiveRecord::Base
  MIN_AGE = 18
  MAX_AGE = 80
  MIN_WEIGHT = 30
  MAX_WEIGHT = 150
  MIN_HEIGHT = 80
  MAX_HEIGHT = 230

  belongs_to :user

  belongs_to :city
  belongs_to :region

  validates :age, :numericality => { :greater_than_or_equal_to => MIN_AGE, :less_than_or_equal_to => MAX_AGE }
  validates :weight, :numericality => { :greater_than_or_equal_to => MIN_WEIGHT, :less_than_or_equal_to => MAX_WEIGHT }
  validates :height, :numericality => { :greater_than_or_equal_to => MIN_HEIGHT, :less_than_or_equal_to => MAX_HEIGHT }

  def self.age_options
    (MIN_AGE..MAX_AGE).step(1).to_a.map{|age| ["#{age}", age]}
  end
end
