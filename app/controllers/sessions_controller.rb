class SessionsController < ApplicationController
	def create
		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password]) 
			session[:user_id] = user.id

			respond_to do |format| 
				format.html { redirect_to profile_path }
				format.json { render json: {}, status: :ok }
			end
		else
			respond_to do |format| 
				format.json { render json: { error_message: 'wrong email or password' }, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end