class User::SpotsController < ApplicationController

  def new
    @spot = Spot.new
  end

  def create
    converted_params = spot_params.merge({user_id: current_user.id}) #観光地登録者のユーザー登録
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
    unless current_user
      redirect_to new_user_session_path
    end
  end

  def edit
    @spot = Spot.find(params[:id])
    unless @spot.user && current_user
      redirect_to new_user_session_path
    end
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
    unless current_user
      redirect_to new_user_session_path
    else
      @user = current_user
      @spots = @user.spots
      favorites = Favorite.where(user_id: current_user.id).pluck(:spot_id)
      @favorite_list = Spot.find(favorites)
    end 
  end
  
  def sarch
  end



  private

  def spot_params
    params.require(:spot).permit(:spot_name, :post_code, :address, :business_day, :business_hour, :parking, :spot_text, :spot_img, :latitude, :longitude)
  end

end
