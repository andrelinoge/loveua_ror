FactoryGirl.define do
  factory :city do
    name "city name"
    association :region, factory: :region
  end

end
