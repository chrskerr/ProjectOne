Rails.application.routes.draw do
  get 'uploads/index'
  get 'uploads/new'
  get 'uploads/create'
  get 'uploads/destroy'
  root :to => 'core#home'
  
  resources :users, :only => [:new, :create]

  resources :uploads, only: [:index, :new, :create, :destroy]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/' => 'session#destroy'
end