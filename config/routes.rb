Rails.application.routes.draw do
  mount API::Base, at: "/"
  get 'home/index'
  devise_for :users
  root to: 'home#index'
  resources :access_points
  resources :file_to_updates
  resources :file_packages do
    resources :file_to_update_file_packages
  end
  resources :bus_stops

  resources :bus_events do
    collection do
      post 'create'
    end
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'access_points#sign_up'
end
