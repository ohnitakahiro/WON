class Event < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  mount_uploader :image, ImageUploader

  # いいね
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  # メニュー
  has_many :menus
  accepts_nested_attributes_for :menus, allow_destroy: true
end
