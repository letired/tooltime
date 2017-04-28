Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :tools, only: [ :index, :new, :create, :show, :edit, :update, :destroy ]
  resources :bookings, only: [ :create, :show ]
  resources :messages, only: [ :create ]
  patch 'update_state', to: 'bookings#update_state'
  resources :users , only: [ ] do
      member do
        get 'bookings', to: 'users#bookings'
        get 'tools', to: 'users#tools'
      end
    end
  mount Attachinary::Engine => "/attachinary"
end

