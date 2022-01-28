class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :comment, {length: {in: 1..30} } #コメントは1以上30以下

end
