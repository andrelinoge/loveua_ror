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
	end

  

end
