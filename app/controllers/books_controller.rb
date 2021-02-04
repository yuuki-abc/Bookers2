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

  def user_update
    user = User.find(params[:id])
    user.update(user_params)
    # yukikome => 空のカラムにアップデートをあてた時の挙動は？
    redirect_to user_path(user)
  end


  private

  def user_params
    # 命名規則は、モデル名_paramsが一般的。
    # paramsメソッドにはフォームから送られてきたデータが入る。
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
