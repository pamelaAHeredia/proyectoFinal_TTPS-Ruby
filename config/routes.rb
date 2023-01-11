Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  namespace :auth, path: '', as: '' do
    resources :users, only: %i[new create]
    resources :sessions, only: %i[new create destroy]
  end

  resources :users
  get '/users/:id/edit_password', to: 'users#edit_password', as: :edit_password
  patch '/users/:id/edit_password', to: 'users#update_password', as: :update_password

  # localidades
  resources :localities
end
