class User::FavoritesController < ApplicationController
  before_action :set_spot
  before_action :authenticate_user!

  def create
    @user = @spot.user
    current_user.favorite(@spot)
  end

  def destroy
    current_user.favorites.find_by(spot_id: @spot.id).destroy
  end


  private

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end
end
