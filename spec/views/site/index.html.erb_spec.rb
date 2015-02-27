require "rails_helper"

describe "site/index" do
	before :each do
		initial_registration = mock_model('InitialRegistration').as_new_record.as_null_object

		assign(:initial_registration, initial_registration)
		render
	end

	it "has registration form" do
		expect(rendered).to have_selector('form#initial_registration')
	end

	it "has email field" do
		expect(rendered).to have_selector('#initial_registration_email')
	end

	it "has name field" do
		expect(rendered).to have_selector('#initial_registration_name')
	end

	it "has age field" do
		expect(rendered).to have_selector('#initial_registration_age')
	end

	it "has gender radio button" do
		expect(rendered).to have_selector('#initial_registration_gender_male')
		expect(rendered).to have_selector('#initial_registration_gender_female')
	end

	it "has seek_gender radio button" do
		expect(rendered).to have_selector('#initial_registration_seek_gender_male')
		expect(rendered).to have_selector('#initial_registration_seek_gender_female')
	end

	it "has Register button" do
		expect(rendered).to have_selector('input[type="submit"]')
	end
end