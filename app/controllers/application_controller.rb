class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #check_authorization # cancancan - check authorization for every action

  # def authenticate_admin_user!
  #   redirect_to root_path unless current_user.admin?
  # end
end