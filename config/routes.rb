Rails.application.routes.draw do
  mount API::Base, at: "/"
  get 'home/index'
  devise_for :users
  root to: 'home#index'
  resources :access_points
  resources :file_to_updates
  resources :file_packages
  resources :bus_stops
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
