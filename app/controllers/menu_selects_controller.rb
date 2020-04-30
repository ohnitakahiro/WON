class MenuSelectsController < ApplicationController
  def new
    @menuselect = MenuSelect.new
  end

  def create
    @menuselect = MenuSelect.new(menuselect_params)
  end

  private
  def menuselect_params
    params.require(:menu_name).permit(:menu_name)
  end
end
