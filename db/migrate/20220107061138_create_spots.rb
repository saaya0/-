class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :spot_name,    null: false
      t.string :post_code,    null: false
      t.string :address,      null: false
      t.string :business_day
      t.string :business_hour
      t.string :parking
      t.string :spot_text,    null: false
      t.string :spot_img,     null: false
      t.boolean 'whether_status', default: false, null: false
      t.boolean 'genre_status', default: false, null: false
      t.timestamps
    end
  end
end
