require 'rails_helper'

RSpec.describe User, type: :model do
	context 'Validations' do
		let(:attributes) {
			{ name: 'user name',
				email: 'valid@mail.com',
				gender: User::MALE,
				role: User::ROLE_USER,
				password: '123456',
			}
		}

		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:gender) }

		it 'success if email valid' do
			expect(User.new(attributes).valid?).to be_truthy
		end

		it 'fails if email invalid' do
			expect(User.new(attributes.update(email: 'invalid!mail.com')).valid?).to be_falsy
		end

		it 'fails if email alredy exists' do
			user = User.create(
				email: 'valid@mail.com',
	      password: '123456',
	      role: User::ROLE_USER,
	      gender: User::MALE,
	      is_email_confirm: true,
	      avatar: 'none',
	      name: 'user name'
			)

			expect(User.new(attributes).valid?).to be_falsy
		end

		it 'success if gender is MALE or FEMAIL' do
			expect(User.new(attributes.update(gender: User::MALE)).valid?).to be_truthy
			expect(User.new(attributes.update(gender: User::FEMALE)).valid?).to be_truthy
		end

		it 'fails if gender is not MALE or FEMAIL' do
			expect(User.new(attributes.update(gender: 0)).valid?).to be_falsy
		end

		it 'fails if no password' do
	  	expect(User.new(attributes.except(:password)).valid?).to be_falsy
	  end

	  it 'fails if password too short' do
	  	expect(User.new(attributes.update(password: 'short')).valid?).to be_falsy
	  end

	  it 'pass if password long enough' do
	  	expect(User.new(attributes.update(password: 'long_password')).valid?).to be_truthy
	  end

	  it { should have_secure_password }
	end
  
end