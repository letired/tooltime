Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :tools, only: [ :index, :show, :new, :create ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Attachinary::Engine => "/attachinary"
end
