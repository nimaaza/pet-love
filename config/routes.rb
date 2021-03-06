Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  # none-CRUD routes
  post '/my_requests/:id/confirm', to: 'bookings#confirm', as: 'confirm'
  get '/my_requests', to: 'bookings#my_requests'

  resources :places do
    member do
      resources :bookings, only: [:new, :create]
    end
  end

  resources :bookings, only: [:destroy]
end
