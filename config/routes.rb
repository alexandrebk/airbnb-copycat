Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  namespace :admin do
      resources :users
      resources :bookings
      resources :flats

      root to: "users#index"
    end
  devise_for :users
  root to: 'pages#home'

  resources :flats do
    resources :bookings, only: [:create, :new, :show, :destroy] do
      resources :reviews, only: [:new, :create]
    end
  end
  get 'my_flat', to: 'flats#my_flat'
  resources :bookings, only: [:index]

  get 'conversations', to: 'messages#conversations'
  resources :users do
    resources :messages, only: [:index, :create]
  end
end
