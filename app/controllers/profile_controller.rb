class ProfileController < ApplicationController
	def show
    authorize! :read, Profile
	end
end