class Event < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  mount_uploader :image, ImageUploader
  
  # コメント
  has_many :comments
  # いいね
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  # メニュー
  has_many :menus, dependent: :destroy
  accepts_nested_attributes_for :menus, allow_destroy: true
end
