Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :tools, only: [ :index, :new, :create, :show, :edit, :update, :destroy ]
  resources :bookings, only: [ :create, :update ]
  patch 'update_state', to: 'bookings#update_state'
  resources :users , only: [ ] do
      member do
        get 'bookings', to: 'users#bookings'
        get 'tools', to: 'users#tools'
      end
    end
  mount Attachinary::Engine => "/attachinary"
end
