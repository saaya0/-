class Message < ApplicationRecord

  validates :name,presence: true, length: { maximum: 20 }
  validates :email,presence: true
  validates :message, presence: true, length: { minimum: 10 }
end
