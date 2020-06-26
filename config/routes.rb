Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :offices, only: %i[index show new create edit update] do
    resources :bookings, only: %i[new create edit update]
  end
  resources :bookings, only: %i[index destroy]
end
