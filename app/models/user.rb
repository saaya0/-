class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :spots, dependent: :destroy

  validates :email, {presence: true}
  validates :name, {length: {in: 1..15} }
  
  def favorite(spot)
    Favorite.create!(user_id: id, spot_id: spot.id)
  end
  #お気に入り解除
  def unfavorite(spot)
    Favorite.find_by(user_id: id, spot_id: spot.id).destroy
  end
  #お気に入り登録
  def favorite?(spot)
    Favorite.find_by(user_id: id, spot_id: spot.id).present?
  end
  
end
