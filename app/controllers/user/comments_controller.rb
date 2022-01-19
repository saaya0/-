class User::CommentsController < ApplicationController

  def create
    spot = Spot.find(params[:spot_id])
    comment = current_user.comments.new(comment_params)
    comment.spot_id = spot.id
    comment.save
    redirect_to spot_path(spot)
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to spot_path(params[:spot_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :coment_img)
  end
end
