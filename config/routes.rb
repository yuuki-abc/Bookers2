Rails.application.routes.draw do
  root 'books#top'
  devise_for :users
  # yukikome => deviseを使用する際にURLとしてusersを含むことを示している

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:new, :create, :index, :show, :destroy]

end
