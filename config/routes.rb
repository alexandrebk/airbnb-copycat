Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :flats do
    resources :bookings, only: [:create, :new, :edit, :update]
  end
  get 'dashboard', to: 'pages#dashboard'
  resources :bookings, only: [:index, :show, :destroy]

end
