Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :tools, only: [ :index, :show, :new, :create ]

  resources :users , only: [ ] do
      member do
        get 'bookings', to: 'users#bookings'
        get 'tools', to: 'users#tools'
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
