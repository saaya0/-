class Admin::UsersController < ApplicationController

  def index
    @user = current_user
    if current_user == @user || current_user.admin?
      @users = User.all.page(params[:page]).per(10)
    else
      redirect_to new_user_session_path
    end
  end

  def revival
    @users = User.all
    user = User.find(params[:id])
    user.update(is_valid: true)
    reset_session
    redirect_to users_path
  end
end
