class User::FavoritesController < ApplicationController
  before_action :set_spot
  before_action :authenticate_user!

  def create
    @user = @spot.user
    current_user.favorite(@spot)
    # respond_to do |format|
    #   format.html { redirect_to request.referrer || root_url }
    #   format.js
    #   response["Content-Type"]="application/javascript"
    # end
  end

  def destroy
    current_user.favorites.find_by(spot_id: @spot.id).destroy
    # respond_to do |format|
    #   format.html { redirect_to request.referrer || root_url }
    #   format.js
    #   response["Content-Type"]="application/javascript"
    # end
  end


  private

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end
end
