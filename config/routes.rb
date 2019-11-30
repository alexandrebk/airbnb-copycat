Rails.application.routes.draw do
  require "sidekiq/web"
  root to: 'pages#home'
  namespace :admin do
    resources :users
    resources :bookings
    resources :flats

    root to: "users#index"
  end
  devise_for :users
  resources :bookings, only: [:index, :show, :destroy]
  resources :flats do
    resources :bookings, only: [:new, :create]
  end
  resources :users do
    resources :messages, only: [:index, :create]
  end
  get 'my_flat', to: 'flats#my_flat'
  get 'conversations', to: 'messages#conversations'
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
