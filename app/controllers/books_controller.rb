class BooksController < ApplicationController

  def index
    @book = Book.new
    # error表示の為だけの関数
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      redirect_to book_path(book), notice: "successfully creation"
    else
      @book = book
      render action: :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    # コメント
    # identification(@book.user) # ←【一覧画面に遷移させないとspecチェックでエラーを貰う。下の三行とは、リダイレクト先が違うだけ】
    unless @book.user == current_user
      redirect_to books_path, alert: "Not authorized"
    end
  end

  def update
    book = Book.find(params[:id])
    identification(book.user)
    if book.update(book_params)
      redirect_to book_path(book), notice: "successfully update"
    else
      @book = book
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    identification(book.user)
    if book.destroy
      redirect_to books_path, notice: "deleted successfully"
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
