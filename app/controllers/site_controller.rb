class SiteController < ApplicationController
	def index
		@initial_registration_form = InitialRegistrationForm.new
	end
end