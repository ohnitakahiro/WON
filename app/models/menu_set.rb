class MenuSet < ApplicationRecord
  belongs_to :menu

  def selectable_menus
    MenuSet.all
  end
end
