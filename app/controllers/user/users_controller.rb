class User::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to new_user_session_path
    end
  end

  def update
    @user= User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def unsubscribe
    @user = User.find_by(params[:id])
    unless @user == current_user
      redirect_to new_user_session_path
    end
  end

  def withdraw
    @user = current_user
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :admin)
  end


end
