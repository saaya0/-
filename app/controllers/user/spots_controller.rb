class User::SpotsController < ApplicationController

  def new
    @spot = Spot.new
  end

  def create
    converted_params = spot_params.merge({user_id: current_user.id})
    @spot = Spot.new(converted_params)
    @spot.save
    redirect_to spots_path
  end

  def index
    @spots = Spot.all
   #gon.spot = @spot
   gon.spot = Spot.last
   gon.spots = Spot.all
  end


  def show
    @spot = Spot.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update(spot_params)
    redirect_to spot_path(@spot)
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to spots_path
  end

  def favorite
    @user = User.find(current_user.id)
    @spots = @user.spots
    p "@spots"
    p @spots
    spot_ids = Favorite.where(user_id: current_user.id).pluck(:spot_id)
  end



  private

  def spot_params
    params.require(:spot).permit(:spot_name, :post_code, :address, :business_day, :business_hour, :parking, :spot_text, :spot_img, :latitude, :longitude)
  end

end
