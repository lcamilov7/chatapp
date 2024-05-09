Rails.application.routes.draw do
  namespace :authentication do
    resources :users, only: %i[new create]
  end

  # root 'sessions#new'
end
