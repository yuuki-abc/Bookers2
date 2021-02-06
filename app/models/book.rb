class Book < ApplicationRecord

  belongs_to :user

  # yukikome =>
  # こちらのカラムにuser_idという名前をつければ、userのidとアソシエーションされる？

   validates :title, presence: true
  # 空じゃない

  validates :body, :presence => true, :length => {maximum: 200}
  # 空じゃない&最大200文字

end
