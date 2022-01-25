class ChangeDetailsToSpots < ActiveRecord::Migration[5.2]
  def change
    change_column :spots, :genre, :json
  end
end
