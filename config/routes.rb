Rails.application.routes.draw do
  devise_for :users
  root to: 'movies#index'
  resources :movies do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show
end
