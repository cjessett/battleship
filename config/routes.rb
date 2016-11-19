Rails.application.routes.draw do
  root 'home#index'
  resource :game, only: [:new, :update]
end
