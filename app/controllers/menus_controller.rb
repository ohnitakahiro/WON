class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    Menu.create(menu_params)
  end

  private
  def menu_params
    paramas.requie(:menu).permit(:name)
  end

end
