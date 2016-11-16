Rails.application.routes.draw do

  root 'application#home'
  resource :game, only: [:new, :update]
end
