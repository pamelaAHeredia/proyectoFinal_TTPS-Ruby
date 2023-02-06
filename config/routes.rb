Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  resources :localities, :branches, :appointments
  resources :schedules, only: %i[edit update destroy] 

  # auth
  namespace :auth, path: '', as: '' do
    resources :users, only: %i[new create]
    resources :sessions, only: %i[new create destroy]
  end

  # only edit update
  resources :users
  # users - password
  get '/users/:id/edit_password', to: 'users#edit_password', as: :edit_password
  patch '/users/:id/edit_password', to: 'users#update_password', as: :update_password
 
  # branches -schedules
  resources :branches do
    resources :schedules
  end

  # appointments
  get '/appointments/:id/edit_attention', to: 'appointments#edit_attention', as: :edit_attention
  patch '/appointments/:id/:personnel_id', to: 'appointments#attend', as: :attended
  post '/appointments/filter', to: 'appointments#filter', as: :appointments_filter
end
