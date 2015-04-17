class SiteController < ApplicationController
	def index
		@initial_registration = InitialRegistrationForm.new
	end
end