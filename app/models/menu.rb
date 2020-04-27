class Menu < ApplicationRecord
  belongs_to :event
  has_many :menu_sets, dependent: :destroy
  accepts_nested_attributes_for :menu_sets

end
