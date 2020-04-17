class RecordsController < ApplicationController
  # before_action :set_record1, only: [:edit, :show]
  # before_action :move_to_index, except: [:index, :show, :search]

  def index
    @records = Record.all
    # includes(:user).order("created_at DESC").page(params[:page])
  end

  def new
    @record = Record.new
  end

  def create
    Record.create(record_params)
    redirect_to action: :index
  end

  # def destroy
  #   tweet = Tweet.find(params[:id])
  #   tweet.destroy
  # end

  # def edit
  # end

  # def update
  #   tweet = Tweet.find(params[:id])
  #   tweet.update(tweet_params)
  # end

  # def show
  #   @comment = Comment.new
  #   @comments = @tweet.comments.includes(:user)
  # end

  private
  def record_params
    params.require(:record).permit(:image, :text)
    # .merge(user_id: current_user.id)
  end

  def set_record
    @record = Record.find(params[:id]) 
  end

  # def move_to_index
  #   redirect_to action: :index unless user_signed_in?
  # end
end
