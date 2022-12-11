Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  namespace :auth, path: '', as: '' do
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
  end 

  resources :users
  get "users/index", to: 'users#index'
  get "/users/:id/edit", to: 'users#edit'
  post "/users/admin_new", to: 'users#admin_create'

end
