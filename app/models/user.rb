class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  # yukikome => テーブル名 booksを登録

  attachment :profile_image
  # yukikome => モデルに、画像アップ用のメソッド（attachment）を追加

  validates :name, :uniqueness => true, :length => {in: 2..20}
  # 重複禁止&2~20字以内

  validates :introduction, length: {maximum: 50}
  # 最大50文字
end
