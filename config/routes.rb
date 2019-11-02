Rails.application.routes.draw do
  root :to => 'users#home'
  resources :users, :only => [:new, :create]
  resources :uploads
  resources :folders
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/' => 'session#destroy'
end