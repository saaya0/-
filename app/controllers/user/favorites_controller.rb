class User::FavoritesController < ApplicationController
  before_action :set_spot

  def create
    if @spot.user_id != current_user.id #もしも観光地投稿者がﾛｸﾞｲﾝユーザーでなければ
      @favorite = Favorite.create(user_id: current_user.id, spot_id: params[:spot_id])
      @favorite.save
      redirect_to spot_path(@spot)
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(spot_id: @spot.id)
    @favorite.destroy
    redirect_to spot_path(@spot)
  end


  private

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end
end
