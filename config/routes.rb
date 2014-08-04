Rails.application.routes.draw do
  

  root 'pages#home', via: :get

  resource :dashboard, only: [:show]
  resources :shouts, only: [:create]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
end
