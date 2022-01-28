class Spot < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :spot_box_relations, dependent: :destroy
  has_many :boxs, through: :spot_box_relations, dependent: :destroy

  belongs_to :user

  has_many_attached :spot_imgs

  geocoded_by :address #adddressカラムを使って経緯度を算出する
  after_validation :geocode #住所変更時に経緯度も変更する

  validates :spot_name, length: {in: 1..20}  #スポット名は 1文字以上20文字以下まで
  validates :spot_text, length: {in: 1..100}
  validates :post_code, presence: true
  validates :address, presence: true         #空ではいけない
  validates :address, uniqueness: true, on: :create      #重複してはいけない
  # validates :spot＿img, presence： true

end
