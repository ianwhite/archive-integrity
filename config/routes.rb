Rails.application.routes.draw do
  root 'home#index'

  resources :films, only: [:show]
  resources :people, only: [:show]
  resources :interactions, only: [:create]
end
