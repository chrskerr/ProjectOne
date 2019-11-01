Rails.application.routes.draw do
  root :to => 'core#home'
  resources :users, :only => [:new, :create]
  resources :uploads, only: [:index, :new, :create, :destroy]
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/' => 'session#destroy'
end