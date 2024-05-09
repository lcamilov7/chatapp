Rails.application.routes.draw do
  namespace :authentication do
    resources :users, only: %i[new create]
    resources :sessions, only: %i[new create]
  end

  # root 'authentication/sessions#new'
end
