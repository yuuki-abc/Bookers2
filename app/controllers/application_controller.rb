class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :all_page_variable, if: :user_signed_in?
  # ユーザーがログイン中であれば、all_page_variableを実行

  def after_sign_in_path_for(resource)
    user_path(current_user) # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  def all_page_variable
    @my_user = User.find(current_user.id)
    @users = User.all
    @new_book = Book.new
    @books = Book.all
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    # コメント => 不明ポイント
  end

end
