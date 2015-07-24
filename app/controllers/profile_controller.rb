class ProfileController < ApplicationController
	def show
    authorize! :read, Profile

    user_id = params.has_key?(:id) ? params[:id] : current_user.id
    @user =  User.includes(:profile, :questionary).find(user_id).decorate
    @profile = @user.profile.decorate
    @questionary = @user.questionary.decorate
	end
end