Rails.application.routes.draw do

  mount API::Base, at: "/"
  get 'home/index'
  devise_for :users
  root to: 'home#index'
  resources :access_points
  resources :file_to_updates
  resources :file_packages
  resources :bus_stops
  resources :services
  resources :access_groups do
    get 'access_group_managements/services_for_access_group'
    get 'access_group_managements/bus_stop_for_access_group'
  end

  resources :bus_events do
    collection do
      post 'create'
    end
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'access_points#sign_up'
  post 'file_packages/ajaxFunction'
  post 'access_group_managements/bus_stop_for_access_group'
end
