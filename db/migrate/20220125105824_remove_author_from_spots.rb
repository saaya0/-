class RemoveAuthorFromSpots < ActiveRecord::Migration[5.2]
  def change
    remove_column :spots, :genre_status, :boolean
  end
end
