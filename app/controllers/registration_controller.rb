class RegistrationController < ApplicationController
	def initial
		@initial_registration_form = InitialRegistrationForm.new(params[:initial_registration_form])
		if @initial_registration_form.valid?
			user = @initial_registration_form.create_user 
			session[:user_id] = user.id

			respond_to do |format|
				format.html { redirect_to final_step_registration_path }
				format.json { render json: {}, status: :ok }
			end
		else
			respond_to do |format|
				format.json { render json: @initial_registration_form.errors, status: :unprocessable_entity }
			end
		end
	end

	def final_step
		
	end

	def complete
		
	end

end