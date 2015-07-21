require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
	describe "GET index" do
		it "renders index template" do
			@user = User.new
			@user.build_profile
			@user.build_questionary

			get :index
			expect(response).to render_template :index
		end
	end
end