class BooksController < ApplicationController

  def books
    @error_message = Book.new
    # booksViewを正常表示させる為だけのインスタンス変数
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      redirect_to user_path(book.user_id), notice: "successful creation"
    else
      @error_message = book
      render action: :books
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    identification(@book.user)
  end

  def update
    book = Book.find(params[:id])
    identification(book.user)
    if book.update(book_params)
      redirect_to user_path(book.user.id), notice: "successful update"
    else
      redirect_to user_path(book.user.id), alert: "error update"
    end
  end

  def destroy
    book = Book.find(params[:id])
    identification(book.user)
    if book.destroy
      redirect_to user_path(book.user.id), notice: "deleted successfully"
    else
      redirect_to user_path(book.user.id), alert: "error delete"
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def identification(user)
    unless user == current_user
      redirect_to user_path(current_user), alert: "Not authorized"
    end
  end

end
