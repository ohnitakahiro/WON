class Event < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  mount_uploader :image, ImageUploader
end
