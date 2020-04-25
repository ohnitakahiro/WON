class UsersController < ApplicationController
  
  def index
    respond_to do |format|
      format.html
      format.json
    end
  end
  
  def show
    @user = User.find(params[:id])
    @name = @user.name
    @events = @user.events
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
