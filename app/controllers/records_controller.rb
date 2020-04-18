class RecordsController < ApplicationController
  before_action :set_record, only: :show
  before_action :move_to_index, except: [:index, :show]

  def index
    @records = Record.all.includes(:user).order("created_at DESC")
  end

  def new
    @record = Record.new
  end

  def create
    Record.create(record_params)
    redirect_to action: :index
  end

  def destroy
    record = Record.find(params[:id])
    record.destroy
    redirect_to action: :index
  end

  def show
  end

  private
  def record_params
    params.require(:record).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_record
    @record = Record.find(params[:id]) 
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
