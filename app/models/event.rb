class Event < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  mount_uploader :image, ImageUploader

  # いいね
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  
end
