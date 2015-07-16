class RegistrationController < ApplicationController
	def initial
		authorize! :create, User

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
		@user = current_user
		authorize! :edit, @user
	end

	def update_account
		@user = current_user
		if @user.update(user_params)
			redirect_to complete_registration_path
		else
			render :complete
		end
		
		authorize! :update, @user
	end

	private

	def registration_params
		params.require(:initial_registration_form).permit(:name, :email, :age, :gender, :seek_gender)
	end

	def user_params
		params.require(:user).permit(
			:avatar, :avatar_cache, 
			profile_attributes: [:zodiak_id, :mood_id, :about, :interesting],
			questionary_attributes: [:age, :weight, :height, :city_id, :region_id]
		)
	end

end