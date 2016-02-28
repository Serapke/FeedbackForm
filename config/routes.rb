Rails.application.routes.draw do

  resources :comments
  resources :admins
  resources :users

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy', as: :logout

  root 'comments#index'
end
