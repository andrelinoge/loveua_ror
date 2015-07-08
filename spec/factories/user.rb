FactoryGirl.define do
  factory :user do
    name 'user'
    email 'valid@mail.com'
    gender User::MALE
    role User::ROLE_USER
    password '123456'
  end

  factory :admin, class: User do
    name 'admin'
    email 'admin@mail.com'
    gender User::MALE
    role User::ROLE_ADMIN
    password '123456'
  end
end