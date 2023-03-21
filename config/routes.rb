Rails.application.routes.draw do
  get 'demo/show'
  resources :albums
  devise_for :users
  resources :users

  get '/KitUI', to: 'demo#show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
