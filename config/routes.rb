Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resource :favorites, only: [:create, :destroy] 
  	resources :book_comments,only: [:create, :destroy]
  end

  root to:'home#top'
  get 'home/about' => 'home#about', as:'about'
end