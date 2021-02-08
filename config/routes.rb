Rails.application.routes.draw do

  root 'tops#top'
  devise_for :users

  get '/home/about' => 'tops#about', as: 'about'

  # get 'users' => 'users#users', as: 'users'
  resources :users, only: [:index, :show, :edit, :update]

  # get 'books' => 'books#books', as: 'books'
  resources :books, only: [:index, :new, :create, :show, :edit, :update, :destroy]

end
