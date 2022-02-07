class User::TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @spots = Spot.all
    @spots = @tag.spots.order("created_at DESC").page(params[:page]).per(8)
  end

  private

  def tag_params
    params.rquire(:tag).permit(:name)
  end
end
