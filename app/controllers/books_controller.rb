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

  private

  def book_params
    # 命名規則は、モデル名_paramsが一般的。
    # paramsメソッドにはフォームから送られてきたデータが入る。
    params.require(:book).permit(:title, :body)
  end


end
