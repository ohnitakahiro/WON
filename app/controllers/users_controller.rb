class UsersController < ApplicationController
  def show
    @name = current_user.name
    @records = current_user.records
  end
end
