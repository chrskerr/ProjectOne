Rails.application.routes.draw do
  root :to => 'users#home'
  resources :users, :only => [:new, :create]
  resources :uploads
  resources :folders 
  resources :chats, :only => [:index, :show, :create]
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/' => 'session#destroy'
  get '/folders/:id/sharing' => 'folders#sharing_edit', :as => 'edit_sharing'
  post '/folders/:id' => 'folders#sharing_update', :as => 'sharing'
end