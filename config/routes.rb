Rails.application.routes.draw do
  get 'showers/index'
  get 'showers/show'
  get 'showers/new'
  get 'showers/create'
  get 'showers/edit'
  get 'showers/update'
  get 'showers/destroy'
  devise_for :users
  root to: 'showers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
