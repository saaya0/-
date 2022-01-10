class ApplicationController < ActionController::Base
  before_action :set_header
  def top; end


  private

  def set_header
    @header = true
    @paths = [root_path, new_user_session_path, new_user_registration_path, new_admin_session_path]
  end

end
