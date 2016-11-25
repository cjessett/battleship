Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'home#index'
  resource :game, only: [:new, :update]
  resources :scores, only: [:index, :create]
end
