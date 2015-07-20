FactoryGirl.define do
  factory :user do
    name 'user'
    email 'valid@mail.com'
    gender User::GENDER_MALE
    role :user
    password '123456'

    association :profile, factory: :profile
    association :questionary, factory: :questionary
  end

  factory :admin, class: User do
    name 'admin'
    email 'admin@mail.com'
    gender User::GENDER_MALE
    role :admin
    password '123456'
  end
end