class User::SpotsController < ApplicationController

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.save
    redirect_to spots_path

  end

  def index
    @spots = Spot.all
    gon.user = @user
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def edit
  end

  def destroy
  end


  private

  def spot_params
    params.require(:spot).permit(:spot_name, :post_code, :address, :business_day, :business_hour, :parking, :spot_text, :spot_img, :latitude, :longitude)
  end

end
