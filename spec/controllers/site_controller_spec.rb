require 'rails_helper'

RSpec.describe SiteController, type: :controller do
	describe "GET index" do
		let!(:form) { mock_model("InitialRegistrationForm").as_new_record }

		before :each do
			InitialRegistrationForm.stub(:new).and_return(form)
		end

		it "renders index template" do
			get :index
			expect(response).to render_template :index
		end

		it "assigns @initial_registration_form to the view" do
			get :index
			expect(assigns[:initial_registration_form]).to eq(form)
		end
	end
end