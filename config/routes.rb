Rails.application.routes.draw do
  root "welcome#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get "/login", to: "sessions#new"

  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :dashboard, only: [:index]
  end
end
