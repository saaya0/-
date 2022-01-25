class UpdateDetailsToSpots < ActiveRecord::Migration[5.2]
  def change
     change_column :spots, :genre, :string
  end
end
