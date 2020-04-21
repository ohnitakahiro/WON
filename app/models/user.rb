class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :records
  validates :name, presence: true, length: { maximum: 6 }
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
