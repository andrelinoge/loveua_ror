class SessionController < ApplicationController
	def create
		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:email]) 
			session[:user_id] = user.id

			respond_to |format| do 
				format.html { redirect_to profile_path }
				format.json { render json: {}, status: :ok }
			end
		else
			respond_to do |format| 
				format.json { render json: user.errors, status: :unprocessable_entity }
			end
		end
	end
end