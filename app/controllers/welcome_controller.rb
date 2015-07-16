class WelcomeController < ApplicationController
  skip_authorization_check 
  
	def index
		@initial_registration_form = InitialRegistrationForm.new
	end
end