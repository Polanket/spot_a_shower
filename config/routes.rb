Rails.application.routes.draw do
  devise_for :users
  root to: 'showers#index'
  resources :users, only: :show
  resources :showers do
    resources :bookings, only: [ :show, :create, :edit, :update, :destroy ]
  end

  get 'results', to: 'showers#results'
end
