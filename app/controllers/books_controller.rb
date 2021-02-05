class BooksController < ApplicationController

  def top
  end

  def users
    @users = User.all
    @user = User.find(current_user.id)
    # @user = Book.find(params[:id])
    @book = Book.new
  end

  def user_show
    @my_user = current_user
    @user = User.find(params[:id])
    # @user = Book.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
    # @books = user.book.reverse_order
    # @books = @user.books.page(params[:page]).reverse_order
    # yukikome => ↑の記述がいいかも？ここ改善
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
    @user = User.find(current_user.id)
    @books = Book.all

    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to user_path(@book.user_id)
      # yukikome => 要検証 IDの指定が無い ※ 対応済み
    else
      render action: :books
    end
  end

  def book_view
    @user = current_user
    @book = Book.new
    @book_show = Book.find(params[:id])
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

  # テスト用
  # def user_delete
  #   user = User.find(params[:id])
  #   user.destroy
  #   redirect_to root_path
  # end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
