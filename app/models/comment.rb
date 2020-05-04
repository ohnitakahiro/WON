class Comment < ApplicationRecord
  belongs_to :event # eventsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
