class Book < ApplicationRecord

  belongs_to :user

  # yukikome =>
  # こちらのカラムにuser_idという名前をつければ、userのidとアソシエーションされる？

  validates :title, presence: true
  validates :body, presence: true

end
