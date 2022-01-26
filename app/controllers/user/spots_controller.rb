class User::SpotsController < ApplicationController
before_action :authenticate_user!,except: [:index]

  def new
    @spot = Spot.new
    @genres = [[0, "play"], [1, "eat"], [2, "viewing"]]
  end

  def create
    converted_params = spot_params.merge({user_id: current_user.id}) #観光地登録者のユーザー登録
    @spot = Spot.new(converted_params)
    if @spot.save
      flash[:success] = "It was successful."
      redirect_to spots_path
    else
      render :new
    end
  end

  def index
    @spot = Spot.new
    #gon.spot = @spot
    gon.spot = Spot.last
    gon.spots = Spot.all
    @spots = Spot.all
    if params[:box_ids]
      @spots = []
      params[:box_ids].each do |key, value|
        @spots += Box.find_by(box_name: key).spots if value == "1"
      end
      @spots.uniq!
    end
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
    @spot.update!(spot_params)
    redirect_to spot_path(@spot)
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to spots_path
  end

  def favorite
      @user = current_user
      @spots = @user.spots
      favorites = Favorite.where(user_id: current_user.id).pluck(:spot_id)
      @favorite_list = Spot.find(favorites)
  end

  def sarch
  end



  private

  def spot_params
    params.require(:spot).permit(:spot_name, :post_code, :address, :spot_text, :spot_img, :latitude, :longitude, box_ids: [])
  end

end
