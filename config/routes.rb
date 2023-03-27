Rails.application.routes.draw do
  get 'copies/index'
  get 'copies/show'
  get 'copies/edit'
  get 'copies/create'
  get 'copies/update'
  get 'copies/destroy'
  resources :ads
  get '/', to:'home#index', as: 'root'
  get '/KitUI', to: 'demo#show'
  get 'demo/show'
  resources :albums
  devise_for :users
  resources :users

  get 'carts/:id' => "carts#show", as: "cart"
  get 'carts/show'
  delete 'carts/:id' => "carts#destroy"

  post 'cartlines' => "cartlines#create"
  get 'cartlines/:id' => "cartlines#show", as: "cartline"
  delete 'cartlines/:id' => "cartlines#destroy", as: 'cartline_destroy'

  # Stripe routes
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
