class AddColumnSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :user_id, :integer
    # add_reference :spots, :users, foreign_key: true
  end
end
