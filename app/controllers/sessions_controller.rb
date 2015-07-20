class SessionsController < Devise::SessionsController
	respond_to :json

	 def create
    self.resource = warden.authenticate!(auth_options)

    sign_in(resource_name, resource)
    yield resource if block_given?

    respond_to do |format|
    	format.json { render json: {}, status: :ok }
    end
  end

  def failure   
    warden.custom_failure!

    render json: { success: false, error_message: 'Wrong password or email' }, status: 401
  end

  def destroy
    super
    flash.delete(:notice)
  end

  protected

  def auth_options
    { :scope => resource_name, :recall => "#{controller_path}#failure" }
  end
end