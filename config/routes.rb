Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :flats do
    resources :bookings, only: [:create, :new, :show, :destroy]
  end
  get 'dashboard', to: 'pages#dashboard'

end
