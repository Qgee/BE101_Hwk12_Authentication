Rails.application.routes.draw do

  root 'home#index'
  resources :posts
  resources :authors

  resources :users, only: [:index, :show, :new, :create]

  resources :home, only: [:index]

  # get '/' => 'home#index'
  # get '/posts' => 'home#post_details'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_in', to: 'sessions#destroy'



end
