Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resource :game, only: [:new, :update]
  resources :scores, only: [:index, :create]
end
