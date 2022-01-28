class RemoveCommentImgFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :comment_img, :string
  end
end
