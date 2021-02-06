Rails.application.routes.draw do

  root 'tops#top'
  devise_for :users

  get 'about' => 'tops#about', as: 'about'

  # get 'users' => 'books#users', as: 'users'
  # get 'users/:id' => 'books#user_show', as: 'user'
  # get 'users/:id/edit' => 'books#user_edit', as: 'user_edit'
  # patch 'users/:id' => 'books#user_update', as: 'user_update'
  get 'users' => 'users#users', as: 'users'
  resources :users, only: [:show, :edit, :update]

  # get 'books' => 'books#books', as: 'books'
  # post 'books' => 'books#book_new', as: 'book_new'
  # get 'books/:id' => 'books#book_view', as: 'book_view'
  # get 'books/:id/edit' => 'books#book_edit', as: 'book_edit'
  # patch 'books/:id' => 'books#book_update', as: 'book_update'
  # delete 'books/:id' => 'books#book_delete', as: 'book_delete'
  get 'books' => 'books#books', as: 'books'
  resources :books, only: [:new, :create, :show, :edit, :update, :destroy]

end
