Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :tools, only: [ :index, :show, :new, :create ]

  resources :bookings, only: [ :create, :update ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
