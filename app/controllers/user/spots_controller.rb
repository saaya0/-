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
      results = Language.get_data(spot_params[:spot_text])
      tag_list = [] #["桜","梅","さわやか"]
      results.each do |result|
        tag_list.push(result["name"]) #タグをtag_listに追加する
      end
      @spot.save_tag(tag_list)
      redirect_to spots_path
    else
      render :new
    end
  end

  def index
    @spot = Spot.new
    gon.spot = Spot.last
    gon.spots = Spot.all
    @spots = Spot.all
    if params[:box_ids]
      @spots = []

      if params[:box_ids].values.any?("1")
        params[:box_ids].each do |key, value|
          if value == "1"
            box_spots = Box.find_by(box_name: key).spots
            @spots = @spots.empty? ? box_spots : @spots & box_spots
          end
        end
      else
       @spots = Spot.all
      end
    end
    Rails.logger.info(@spots.map(&:id))
  end

  def show
    @spot = Spot.find(params[:id])
    @comment = Comment.new
    @images = @spot.images.order("created_at DESC").page(params[:page]).per(4)
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    if params[:spot][:image_ids] #選択した画像の削除
      params[:spot][:image_ids].each do |image_id|
        image = @spot.images.find(image_id)
        image.purge
      end
    end
    if @spot.update_attributes(spot_params)
      results = Language.get_data(spot_params[:spot_text])
      tag_list = []
      results.each do |result|
        tag_list.push(result["name"]) #タグをtag_listに追加する
      end
      @spot.save_tag(tag_list)
      redirect_to spot_path(@spot)
    else
      render :edit
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to spots_path
  end

  def favorite
    favorites = Favorite.where(user_id: current_user.id).pluck(:spot_id)
    @favorite_list = Spot.find(favorites)
  end

  private

  def spot_params
    params.require(:spot).permit(:spot_name, :post_code, :address, :spot_text, :latitude, :longitude, box_ids: [], images: [], spotimgs_attachments_attributes: [ :id, :_destroy ])
  end
end
