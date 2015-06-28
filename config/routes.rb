Rails.application.routes.draw do

  root 'posts#index'
  resources :posts
  resources :authors

  # get '/' => 'home#index'
  # get '/posts' => 'home#post_details'

end
