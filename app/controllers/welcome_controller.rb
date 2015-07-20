class WelcomeController < ApplicationController
  skip_authorization_check 
  
	def index
    if !user_signed_in?
  		@user = User.new
      @user.build_profile
      @user.build_questionary
    end
	end
end