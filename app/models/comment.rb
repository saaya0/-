class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :comment, {length: {in: 1..30} } #コメントは1以上330以下

end
