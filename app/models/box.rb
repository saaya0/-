class Box < ApplicationRecord

  has_many :spot_box_relations, dependent: :destroy
  has_many :spots, through: :spot_box_relations, dependent: :destroy


end