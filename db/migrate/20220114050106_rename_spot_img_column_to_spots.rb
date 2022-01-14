class RenameSpotImgColumnToSpots < ActiveRecord::Migration[5.2]
  def change
    rename_column :spots, :spot_img, :spot_img_id
  end
end
