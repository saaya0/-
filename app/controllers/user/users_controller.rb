class User::UsersController < ApplicationController
before_action :authenticate_user!
  def show
    @user = current_user
    @spots = @user.spots.page(params[:page]).per(8)
    @spot = Spot.find(params[:id])
    
  end

  def update
    @user= User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def unsubscribe
    @user = User.find_by(params[:id])
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