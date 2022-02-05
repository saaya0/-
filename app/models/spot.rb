class Spot < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :spot_box_relations, dependent: :destroy
  has_many :boxs, through: :spot_box_relations, dependent: :destroy
  has_many :tags, dependent: :destroy
  belongs_to :user

  has_many_attached :images

  geocoded_by :address #adddressカラムを使って経緯度を算出する
  after_validation :geocode #住所変更時に経緯度も変更する

  validates :spot_name, length: {in: 1..20}  #スポット名は 1文字以上20文字以下まで
  validates :spot_text, length: {in: 1..200}
  validates :post_code, presence: true
  validates :address, presence: true  #空ではいけない
  validates :address, uniqueness: true, on: :create  #重複してはいけない
  validate :image_type, :image_size  #画像の種類・ファイルのサイズ制限

  private

  def image_type
    images.each do |image|
      unless image.blob.content_type.in?(%('image/jpeg image/png'))
        image.purge
        errors.add(:images, ':please upload in png or jpeg format')
      end
    end
  end

  def image_size
    images.each do |image|
      if image.blob.byte_size > 5.megabytes
        image.purge
        errors.add(:images, ":please keep one file within 5mb")
      end
    end
  end
end
