class Menu < ApplicationRecord
  belongs_to :event
  has_many :menu_sets, dependent: :destroy
  accepts_nested_attributes_for :menu_sets, allow_destroy: true


  def selectable_menus
    Menu.all
  end

end
