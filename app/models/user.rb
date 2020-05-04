class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :events, dependent: :destroy
  validates :name, presence: true, length: { maximum: 6 }
  validates :image, presence: true

  # フォロー機能
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

  has_many :followings, through: :following_relationships
 
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
 
  has_many :followers, through: :follower_relationships
 
   def following?(other_user)
     following_relationships.find_by(following_id: other_user.id)
   end
 
   def follow!(other_user)
     following_relationships.create!(following_id: other_user.id)
   end
 
   def unfollow!(other_user)
     following_relationships.find_by(following_id: other_user.id).destroy
   end
  # ユーザー検索機能
  def self.search(input, id)
    return nil if input == ""
    User.where(['name LIKE ?', "%#{input}%"] ).where.not(id: id).limit(10)
  end

  # いいね
  has_many :likes, dependent: :destroy
  has_many :liked_events, through: :likes, source: :event
  def already_liked?(event)
    self.likes.exists?(event_id: event.id)
  end

  # コメント
  has_many :comments

  mount_uploader :image, ImageUploader
end
