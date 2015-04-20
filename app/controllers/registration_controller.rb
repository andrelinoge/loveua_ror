class RegistrationController < ApplicationController
	def initial
		@initial_registration = InitialRegistrationForm.new(params[:initial_registration_form])
	end

	def final_step
		
	end

	def complete
		
	end

end