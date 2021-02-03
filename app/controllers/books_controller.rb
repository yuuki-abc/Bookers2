class BooksController < ApplicationController

  def top
  end

  def users
    @users = User.all
  end

  def user_show
    @user = User.find(params[:id])
  end

  def user_edit
    @user = User.find(params[:id])
  end

end
