class Menu < ApplicationRecord
  belongs_to :event
  has_many :notes, dependent: :destroy
  accepts_nested_attributes_for :notes

end
