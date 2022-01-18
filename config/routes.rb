Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  resources :posts, only: [:index,:create,:update,:edit,:destroy] do 
    resources :comments, only: [:create,:destroy]
    resources :likes, only: [:create,:destroy]
  end 
  resources :friendships, only: [:create, :destroy]
  resources :feeds, only: [:current, :index]
  get '/users/:id', to: 'users#index', as: :user_page
  root "feeds#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
