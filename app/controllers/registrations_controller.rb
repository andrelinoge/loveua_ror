class RegistrationsController < Devise::RegistrationsController

	def create

    build_resource

    resource.build_questionary
		resource.build_profile

		resource.assign_attributes(sign_up_params)

		generated_password = Devise.friendly_token.first(8)
		resource.password  = generated_password
		resource.role      = :user
    resource.save

    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        
        respond_to do |format|
		    	format.json { render json: {}, status: :ok }
		    end
      else
        expire_data_after_sign_in!

        respond_to do |format|
		    	format.json { render json: {}, status: :ok }
		    end
      end

      RegistrationMailer.welcome(resource, generated_password).deliver_now
    else
      #clean_up_passwords resource
      #set_minimum_password_length

      respond_to do |format|
	    	format.json { render json: resource.errors, status: :unprocessable_entity }
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

	def sign_up_params
		params.require(:user).permit(
			:email, :password, :password_confirmation, :first_name, :last_name, :gender,
      questionary_attributes: [ :seek_gender, :age ]
		)
	end

	def user_params
		params.require(:user).permit(
			:avatar, :avatar_cache, 
			profile_attributes: [:zodiak_id, :mood_id, :about, :interesting],
			questionary_attributes: [:age, :weight, :height, :city_id, :region_id]
		)
	end

end