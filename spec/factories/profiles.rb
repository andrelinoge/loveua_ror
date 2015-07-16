FactoryGirl.define do
  factory :profile do
    association :mood, factory: :mood
    association :zodiak, factory: :zodiak
    interesting "interesting text"
    about "about text"
  end

end
