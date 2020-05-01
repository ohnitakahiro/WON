class MenuSelectsController < ApplicationController
  def new
    @menu_select = MenuSelect.new
  end

  def create
    @menu_select = MenuSelect.create(menu_select_params)
    if @menu_select.save
      redirect_to new_event_path, notice: '新規メニュー登録完了'
    else
      redirect_to new_menu_select_path, notice: '※登録失敗（既に登録されています）' 
    end
  end

  private
  def menu_select_params
    params.require(:menu_select).permit(:menu_name)
  end
end
