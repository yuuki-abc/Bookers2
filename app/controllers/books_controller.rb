class BooksController < ApplicationController

  def top
  end

  def users
  end

  def user_show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
  end

  def user_edit
    @user = User.find(params[:id])
  end

  def user_update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  def books
    @error_message = Book.new
    # booksViewを正常表示させる為だけのインスタンス変数
  end

  def book_new
    @user = User.find(current_user.id)

    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      redirect_to user_path(book.user_id)
    else
      @error_message = book
      render action: :books
    end
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
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
