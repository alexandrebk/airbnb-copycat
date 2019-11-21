Rails.application.routes.draw do
  require "sidekiq/web"
  namespace :admin do
      resources :users
      resources :bookings
      resources :flats

      root to: "users#index"
    end
  devise_for :users
  root to: 'pages#home'

  resources :flats do
    resources :bookings, only: [:create, :new, :show, :destroy]
  end
  get 'my_flat', to: 'flats#my_flat'
  resources :bookings, only: [:index]

  get 'conversations', to: 'messages#conversations'
  resources :users do
    resources :messages, only: [:index, :create]
  end

  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
