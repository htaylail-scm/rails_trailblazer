Rails.application.routes.draw do

  root 'sessions#welcome'

  # for login
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#log_out'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  
  # for users
  resources :users do
    collection do
      get :search, to: "users#search"
    end
    member do
    end
  end
  
  # for posts
  resources :posts do
    collection do
      get :download
      get :upload
      post :import_csv
      get :search, to: "posts#search"
    end
  end

  # for password change
  get 'password/:id', to: 'passwords#edit', as: 'edit_password'
  post 'password/:id', to: 'passwords#update'

  # for password reset
  get 'reset/password', to: 'passwords#new'
  post 'reset/password', to: 'passwords#create'
  get 'reset/password/edit', to: 'passwords#editReset'
  patch 'reset/password/edit', to: 'passwords#updateReset'

end