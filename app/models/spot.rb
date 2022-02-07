class Spot < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :spot_box_relations, dependent: :destroy
  has_many :boxs, through: :spot_box_relations, dependent: :destroy
  has_many :spot_tag_relations, dependent: :destroy
  has_many :tags, through: :spot_tag_relations #destroy追加すると、他の同じタグもつられるから不要


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

  before_destroy :destroy_images #削除時、先に画像が消える


  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
      #タグが既に存在していれば、タグ名を配列として全て選択
    old_tags = current_tags - sent_tags
      #oldtag = 既に存在タグ - 新しいタグ
    new_tags = sent_tags - current_tags
      #new_tags = 新しいタグ - 既に存在タグ
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end
      #古いタグ削除
    new_tags.each do |new|
      new_spot_tag = Tag.find_or_create_by(name: new)
      self.tags << new_spot_tag
    end
     #新しいタグ保存
  end


  private

  def destroy_images
    images.purge
  end

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
