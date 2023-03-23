Rails.application.routes.draw do
  get '/', to:'home#index', as: 'root'
  get 'demo/show'
  resources :albums
  devise_for :users
  resources :users
  get '/KitUI', to: 'demo#show'

  get 'carts/:id' => "carts#show", as: "cart"
  get 'carts/show'
  delete 'carts/:id' => "carts#destroy"

  post 'cartlines' => "cartlines#create"
  get 'cartlines/:id' => "cartlines#show", as: "cartline"
  delete 'cartlines/:id' => "cartlines#destroy", as: 'cartline_destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
