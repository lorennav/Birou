Rails.application.routes.draw do
  root to: 'offices#index'
  resources :offices, only: %i[index show new create] do
    resources :bookings, only: %i[new create edit update]
  end
  resources :bookings, only: %i[index destroy]
end
