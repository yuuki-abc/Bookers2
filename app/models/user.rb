class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        # yukikome = >
        # :database_authenticatable（パスワードの正確性を検証）
        # :registerable（ユーザ登録や編集、削除）
        # :recoverable（パスワードをリセット）
        # :rememberable（ログイン情報を保存）
        # :validatable（emailのフォーマットなどのバリデーション）

         has_many :books, dependent: :destroy
        # yukikome => テーブル名 booksを登録

        attachment :profile_image
        # yukikome => モデルに、画像アップ用のメソッド（attachment）を追加

end
