Rails.application.routes.draw do
  namespace :authentication do
    resources :users, only: %i[new create]
    resources :sessions, only: %i[new create destroy]
  end

  resources :users, only: %i[index show edit update destroy]

  resources :rooms do
    resources :messages
  end

  root 'rooms#index'
end
