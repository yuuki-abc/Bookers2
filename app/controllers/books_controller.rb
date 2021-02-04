class BooksController < ApplicationController

  def top
  end

  def users
    @users = User.all
  end

  def user_show
    @user = User.find(params[:id])
    # @user = Book.find(params[:id])
    @book = Book.new
    @books= Book.where(user_id: @user.id)
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

  def books
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def book_new
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path
    # yukikome => 要検証 IDの指定が無い
  end

  def book_view
     @book = Book.find(params[:id])
  end

  def book_edit
    @book = Book.find(params[:id])
  end

   def book_update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to user_path(book.user.id)
  end

  def book_delete
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(book.user.id)
  end

  private

  def user_params
    # 命名規則は、モデル名_paramsが一般的。
    # paramsメソッドにはフォームから送られてきたデータが入る。
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
