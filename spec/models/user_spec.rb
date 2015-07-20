require 'rails_helper'

RSpec.describe User, type: :model do
	let(:attributes) {
		{ 
			first_name: 'first_name',
			last_name: 'last_name',
			email: 'valid@mail.com',
			gender: User::GENDER_MALE,
			role: :user,
		}
	}

	context 'Validations' do
		it { should validate_presence_of(:first_name) }
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
	      role: :user,
	      gender: User::GENDER_MALE,
	      avatar: 'none',
	      first_name: 'first_name',
	      last_name: 'last_name'
			)

			expect(User.new(attributes).valid?).to be_falsy
		end

		it 'success if gender is MALE or FEMAIL' do
			expect(User.new(attributes.update(gender: User::GENDER_MALE)).valid?).to be_truthy
			expect(User.new(attributes.update(gender: User::GENDER_FEMALE)).valid?).to be_truthy
		end

		it 'fails if gender is not MALE or FEMAIL' do
			expect {User.new(attributes.update(gender: 0)) }.to raise_error(ArgumentError)
		end

	end

	context 'Mailing' do
		it 'sends welcome email with password' do
			expect { User.create(attributes) }.to change { ActionMailer::Base.deliveries.count }.by(1)
		end
	end
  
end