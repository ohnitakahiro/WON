class MenuSelect < ApplicationRecord
  validates :menu_name, presence: true, uniqueness: true
end
