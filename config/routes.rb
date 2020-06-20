Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments,only: [:create, :destroy]
  end
  #フォロー機能
  resources :relationships, only: [:create, :destroy]

  root to:'home#top'
  get 'home/about' => 'home#about', as:'about'
  get 'users/:id/follows' => 'relationships#follows', as:'follows'
  get 'users/:id/followers' => 'relationships#followers', as:'followers'
end