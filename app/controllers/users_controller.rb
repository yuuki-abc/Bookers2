class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
    identification(@user)
  end

  def update
    user = User.find(params[:id])
    identification(user)
    if user.update(user_params)
      redirect_to user_path(user), notice: "successfully update"
    else
      @user = user
      render action: :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def identification(user)
    unless user == current_user
      redirect_to user_path(current_user), alert: "Not authorized"
    end
  end

end
