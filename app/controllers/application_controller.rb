class ApplicationController < ActionController::Base
  before_action :set_header
  before_action :configure_permitted_parameters, if: :devise_controller?

  def top; end

  def after_sign_in_path_for(resource)
    spots_path
  end

  def after_sign_up_path_for(resource)
    spots_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


  private

  def set_header
    @header = true
    @paths = [root_path, new_user_session_path, new_user_registration_path, new_admin_session_path]
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:spot, keys: [:address])
  end
end
