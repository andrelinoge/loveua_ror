class SessionsController < ApplicationController
	skip_authorization_check 

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		
		if user && user.authenticate(params[:session][:password]) 
			log_in user
			params[:session][:remember_me] == 1 ? remember(user) : forget(user)

			respond_to do |format| 
				format.html { redirect_to own_profile_path }
				format.json { render json: {}, status: :ok }
			end
		else
			respond_to do |format| 
				format.json { render json: { error_message: 'wrong email or password' }, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		log_out if logged_in?
		
		redirect_to root_url
	end
end