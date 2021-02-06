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
    identification(@user)
  end

  def user_update
    user = User.find(params[:id])
    identification(user)
    if user.update(user_params)
      redirect_to user_path(user), notice: "successful update"
    else
      redirect_to user_path(user), alert: "error update"
    end
  end

  def books
    @error_message = Book.new
    # booksViewを正常表示させる為だけのインスタンス変数
  end

  def book_new
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      redirect_to user_path(book.user_id), notice: "successful creation"
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
    identification(@book.user)
  end

  def book_update
    book = Book.find(params[:id])
    identification(book.user)
    if book.update(book_params)
      redirect_to user_path(book.user.id), notice: "successful update"
    else
      redirect_to user_path(book.user.id), alert: "error update"
    end
  end

  def book_delete
    book = Book.find(params[:id])
    identification(book.user)
    if book.destroy
      redirect_to user_path(book.user.id), notice: "deleted successfully"
    else
       redirect_to user_path(book.user.id), alert: "error delete"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def identification(user)
    unless user == current_user
      redirect_to user_path(current_user), alert: "this page cannot be edited"
    end
  end

end
