class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :spot_name,    null: false
      t.string :post_code,    null: false
      t.string :address,      null: false
      t.string :spot_text,    null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
