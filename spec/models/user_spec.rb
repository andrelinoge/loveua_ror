require 'rails_helper'

RSpec.describe User, type: :model do
  it 'fails if no password' do
  	expect(User.new({email: 'user@mail.com', gender: User::MALE, role: User::ROLE_USER}).save).to be_falsy
  end

  it 'fails if password too short' do
  	expect(User.new({email: 'user@mail.com', gender: User::MALE, role: User::ROLE_USER, password: 'short'}).save).to be_falsy
  end

  it 'pass if password long enough' do
  	expect(User.new({email: 'user@mail.com', gender: User::MALE, role: User::ROLE_USER, password: 'long_password'}).save).to be_truthy
  end
end
