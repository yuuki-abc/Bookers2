class Book < ApplicationRecord

  belongs_to :user

  # yukikome =>
  # こちらのカラムにuser_idという名前をつければ、userのidとアソシエーションされる？

end
