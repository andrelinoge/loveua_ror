class RegistrationController < ApplicationController
	def initial
		@initial_registration = InitialRegistrationForm.new(params[:initial_registration_form])

		if @initial_registration.valid?
			user = @initial_registration.create_user 
			session[:user_id] = user.id

			redirect_to :final_step and return
		end

		render nothing: true
	end

	def final_step
		render nothing: true
	end

	def complete
		
	end

end