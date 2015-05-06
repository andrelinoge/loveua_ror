require 'rails_helper'

RSpec.describe RegistrationController, type: :controller do
	describe "POST initial" do
		let!(:valid_params) {{
				email: 'email@mail.com',
				name: 'username',
				age: '20',
				gender: User::MALE,
				seek_gender: User::FEMALE
		}}

		let!(:invalid_params) {{
				email: 'email#mail.com',
				name: 'username',
				age: '2',
				gender: User::MALE,
				seek_gender: User::FEMALE
		}}

		it "creates InitialRegistrationForm object and populates with params" do
			post :initial, initial_registration_form: valid_params, format: :json

			expect(assigns[:initial_registration_form]).not_to be_nil
			expect(assigns[:initial_registration_form].email).to eq('email@mail.com')
		end

		it "respond with status :ok if form is valid"  do
			post :initial, initial_registration_form: valid_params, format: :json
			expect(response.status).to eq(200)
		end

		it "respond with status :unprocessable_entity and array of errors in JSON format if form is invalid" do
			post :initial, initial_registration_form: invalid_params, format: :json
			expect(response.status).to eq(422)
		end
	end
end