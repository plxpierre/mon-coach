Rails.application.routes.draw do
  get 'about', to: 'pages#about', as: :about
  devise_for :users

  # Health check (généré par Rails)
  get "up" => "rails/health#show", as: :rails_health_check

  # Page d'accueil
  root "programs#index"

  # Routes programmes
  resources :programs, only: [:index, :show, :new, :create, :destroy] do
    resources :weeks, only: [:show]
  end
end
