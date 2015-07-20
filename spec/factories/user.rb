FactoryGirl.define do
  factory :user do
    first_name 'first_name'
    last_name 'last_name'
    email 'valid@mail.com'
    gender User::GENDER_MALE
    role :user
    password '12345678'

    association :profile, factory: :profile
    association :questionary, factory: :questionary
  end

  factory :admin, class: User do
    first_name 'admin'
    last_name 'admin'
    email 'admin@mail.com'
    gender User::GENDER_MALE
    role :admin
    password '12345678'
  end
end