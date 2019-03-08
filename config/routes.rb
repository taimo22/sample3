Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
  resources :users, only: [:show, :edit, :update]
  resources :topics, only: [:new, :create, :destroy]

  resources :ownerships, only: [:create, :destroy]
  get 'rankings/good', to: 'rankings#good'
end
