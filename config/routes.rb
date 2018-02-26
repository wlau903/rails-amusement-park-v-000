Rails.application.routes.draw do
  root 'welcome#home'
  #look over if sessions controller needed
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/rides/new' => 'rides#create'
  resources :attractions
  resources :users

end
