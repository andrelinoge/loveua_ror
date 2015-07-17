class WelcomeController < ApplicationController
  skip_authorization_check 
  
	def index
		@user = User.new
    @user.build_profile
    @user.build_questionary
	end
end