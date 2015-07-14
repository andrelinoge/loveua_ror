require 'rails_helper'

RSpec.describe InitialRegistrationForm, type: :model do

	context 'Validations' do
		let(:attributes) {
			{ name: 'user name',
				email: 'valid@mail.com',
				age: 18,
				gender: User::MALE,
				seek_gender: User::FEMALE
			}
		}

		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:age) }
		it { should validate_presence_of(:gender) }
		it { should validate_presence_of(:seek_gender) }

		it 'success if email valid' do
			expect(InitialRegistrationForm.new(attributes).valid?).to be_truthy
		end

		it 'fails if email invalid' do
			expect(InitialRegistrationForm.new(attributes.update(email: 'invalid!mail.com')).valid?).to be_falsy
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

			expect(InitialRegistrationForm.new(attributes).valid?).to be_falsy
		end

		it 'fails if age is less 18 or more then 80' do
			expect(InitialRegistrationForm.new(attributes.update(age: 17)).valid?).to be_falsy
			expect(InitialRegistrationForm.new(attributes.update(age: 81)).valid?).to be_falsy
		end

		it 'success if age is >= 18 and <= 80' do
			expect(InitialRegistrationForm.new(attributes.update(age: 18)).valid?).to be_truthy
			expect(InitialRegistrationForm.new(attributes.update(age: 80)).valid?).to be_truthy
		end

		it 'success if gender is MALE or FEMAIL' do
			expect(InitialRegistrationForm.new(attributes.update(gender: User::MALE)).valid?).to be_truthy
			expect(InitialRegistrationForm.new(attributes.update(gender: User::FEMALE)).valid?).to be_truthy
		end

		it 'fails if gender is not MALE or FEMAIL' do
			expect(InitialRegistrationForm.new(attributes.update(gender: 0)).valid?).to be_falsy
		end

		it 'success if seek gender is MALE or FEMAIL' do
			expect(InitialRegistrationForm.new(attributes.update(seek_gender: User::MALE)).valid?).to be_truthy
			expect(InitialRegistrationForm.new(attributes.update(seek_gender: User::FEMALE)).valid?).to be_truthy
		end

		it 'fails if seek gender is not MALE or FEMAIL' do
			expect(InitialRegistrationForm.new(attributes.update(seek_gender: 0)).valid?).to be_falsy
		end
	end

  context 'Functionality' do
  	let(:valid_attributes) {
			{ name: 'user name',
				email: 'valid@mail.com',
				age: 18,
				gender: User::MALE,
				seek_gender: User::FEMALE
			}
		}

  	it 'Should create user for given valid params with related models' do
  		form = InitialRegistrationForm.new(valid_attributes)
  		user = form.create_user

  		expect(User.exists?(id: user.id)).to be_truthy
  		expect(Profile.exists?(user_id: user.id)).to be_truthy
  		expect(Questionary.exists?(user_id: user.id)).to be_truthy
  	end

  end

end
