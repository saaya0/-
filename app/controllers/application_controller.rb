class ApplicationController < ActionController::Base
  #before_action :set_header
  def top; end


  private

  def set_header
    @is_header = true
    paths = [root_path, new_user_session_path, new_user_registration_path, new_admin_session_path]
    paths.each do |path|
      if current_page?(path)
        @is_header = false
      end
    end
  end

end
