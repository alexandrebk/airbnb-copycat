Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :bookings
    resources :flats
    root to: "users#index"
  end
  root to: 'pages#home'
  devise_for :users
  resources :users do
    resources :messages, only: [:index, :create]
  end
  resources :flats do
    resources :bookings, only: [:create, :new, :show, :destroy]
  end
  resources :bookings, only: [:index] do
    resources :reviews, only: [:create]
  end
  get 'my_flat', to: 'flats#my_flat'
  get 'conversations', to: 'messages#conversations'
end
