class Record < ApplicationRecord
  validates :text, presence: true
end
