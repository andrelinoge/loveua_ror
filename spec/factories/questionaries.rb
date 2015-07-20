FactoryGirl.define do
  factory :questionary do
    age 18
    seek_gender User::GENDER_FEMALE
    gender User::GENDER_MALE
    height 170
    weight 60
  end

end
