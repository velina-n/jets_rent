# config/routes.rb
Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root to: "pages#home"

  # Routes pour les jets et les réservations
  resources :jets do
    resources :bookings, only: [:index, :new, :create]
  end

  # Routes personnalisées pour accepter et refuser les réservations
  resources :bookings, only: [] do
    member do
      patch :accept
      delete :decline
    end
  end

  # Dashboard
  get '/dashboard', to: 'pages#dashboard'

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
