Rails.application.routes.draw do
  root 'pages#index'
  get '/gamepage', to: 'pages#game'
  resource :game, only: [:show, :create, :update]
end
