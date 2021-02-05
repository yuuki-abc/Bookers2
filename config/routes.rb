Rails.application.routes.draw do
  root 'books#top'
  devise_for :users
  # yukikome => deviseを使用する際にURLとしてusersを含むことを示している

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :books, only: [:new, :create, :index, :show, :destroy]
  get 'about' => 'books#about', as: 'about'

  get 'users' => 'books#users', as: 'users'
  get 'users/:id' => 'books#user_show', as: 'user'
  get 'users/:id/edit' => 'books#user_edit', as: 'user_edit'
  patch 'users/:id' => 'books#user_update', as: 'user_update'

  get 'books' => 'books#books', as: 'books'
  post 'books' => 'books#book_new', as: 'book_new'
  get 'books/:id' => 'books#book_view', as: 'book_view'
  get 'books/:id/edit' => 'books#book_edit', as: 'book_edit'
  patch 'books/:id' => 'books#book_update', as: 'book_update'
  delete 'books/:id' => 'books#book_delete', as: 'book_delete'


end
