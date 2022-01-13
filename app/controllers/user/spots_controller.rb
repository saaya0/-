class User::SpotsController < ApplicationController

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new
    @spot.save
    redirect_to spot_path(@spot)

  end

  def index
    @spots = Spot.all
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
    params.require(:spot).permit(:spot_name, :post_code, :adress, :business_day, :business_hour, :parking, :spot_text, :spot_img, :latitude, :longitude)
  end

end
