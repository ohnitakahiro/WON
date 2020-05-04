class Comment < ApplicationRecord
  belongs_to :event  # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
