Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index,:create,:update,:edit,:destroy]
  resources :friendships, only: [:create, :destroy]
  get '/users/:id', to: 'posts#current', as: :user_page
  root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
