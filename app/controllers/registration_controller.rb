class RegistrationController < ApplicationController
	def initial
		@initial_registration_form = InitialRegistrationForm.new(registration_params)
		if @initial_registration_form.valid?
			user = @initial_registration_form.create_user 
			log_in user

			respond_to do |format|
				format.html { redirect_to complete_registration_path }
				format.json { render json: {}, status: :ok }
			end
		else
			respond_to do |format|
				format.json { render json: @initial_registration_form.errors, status: :unprocessable_entity }
			end
		end
	end

	def complete
		
	end

	private

	def registration_params
		params.require(:initial_registration_form).permit(:name, :email, :age, :gender, :seek_gender)
	end

end