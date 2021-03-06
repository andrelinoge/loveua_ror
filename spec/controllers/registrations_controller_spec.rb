require 'rails_helper'

RSpec.describe RegistrationsController do
	describe "POST initial" do

		it "creates user for valid params" do
			params = FactoryGirl.attributes_for(:user)

			@request.env["devise.mapping"] = Devise.mappings[:user]
			params[:questionary_attributes] = FactoryGirl.attributes_for(:questionary)

			post :create, user: params, format: :json

			user = User.find_by(email: params[:email])

			expect(response.status).to eq(200)
			expect(user.email).to eq(params[:email])
		end

		# it "respond with status :ok if form is valid"  do
		# 	post :initial, initial_registration_form: valid_params, format: :json
		# 	expect(response.status).to eq(200)
		# end

		# it "respond with status :unprocessable_entity and array of errors in JSON format if form is invalid" do
		# 	post :initial, initial_registration_form: invalid_params, format: :json
		# 	expect(response.status).to eq(422)
		# end
	end
end