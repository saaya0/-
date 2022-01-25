class AddDetailsToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :genre, :string
  end
end
