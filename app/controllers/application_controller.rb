class ApplicationController < ActionController::Base
  before_action :set_header
  before_action :configure_sign_up_params, if: :devise_controller?

  def top; end

  def after_sign_in_path_for(resource)
    spots_path
  end

  def after_sign_up_path_for(resource)
    spots_path
  end

  private
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_header
    @header = true
    @paths = [root_path, new_user_session_path, new_user_registration_path, new_admin_session_path]
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:spot, keys: [:address])
  end
end
