class Spot < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :spot_img

  geocoded_by :address #adddressカラムを使って経緯度を算出する
  after_validation :geocode #住所変更時に経緯度も変更する

end
