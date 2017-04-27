Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  patch 'update_state', to: 'bookings#update_state'
  resources :tools, only: [ :index, :show, :new, :create ]
  resources :bookings, only: [ :create, :update ]
  resources :users , only: [ ] do
      member do
        get 'bookings', to: 'users#bookings'
        get 'tools', to: 'users#tools'
      end
    end
  mount Attachinary::Engine => "/attachinary"
end

