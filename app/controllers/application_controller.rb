# yukikome => るコントローラ間で共通に使用するメソッドがここに記される

class ApplicationController < ActionController::Base

  # before_action :authenticate_user!,except: [:top]
  # before_action :authenticate_user!,except: [:about] # yukikome => この2つを一列でかけるのでは？
  # yukikome => before_actionメソッドは、
  # このコントローラが動作する前に実行される
  # :authenticate_user!はログイン認証されていなければ、
  # ログイン画面へリダイレクトするといった機能
  # except: [:top]はトップ以外で、という意味
  before_action :configure_permitted_parameters, if: :devise_controller?

  # yukikome => デバイス機能を利用する前に、メソッドconfigure_permitted_parametersを
  # 呼び出す

  def after_sign_in_path_for(resource)
    user_path(current_user) # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  protected
  # yukikome => ここ以外のコントローラーでも呼べる

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # yukikome => ユーザ名（name）のデータ操作を許可
  # ストロングパラメーターみたいなもの
  # メールアドレスとパスワードの許可は元からの機能につき、実装済み？

end
