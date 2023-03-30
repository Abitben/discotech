Rails.application.routes.draw do
  devise_for :users
  get '/', to:'home#index', as: 'root'
  resources :users do
    resources :avatars, only: [:create]
    resources :collection, only: [:index]
    resources :wishlist, only: [:index]
    resources :orders, only: [:index]
    resources :ads, only: [:index]
  end

  get 'avatars/create'

  resources :marketplace, only: [:index, :show]

  get '/KitUI', to: 'demo#show'

  resources :albums

  get 'carts/:id' => "carts#show", as: "cart"
  get 'carts/show'
  delete 'carts/:id' => "carts#destroy"

  post 'cartlines' => "cartlines#create"
  get 'cartlines/:id' => "cartlines#show", as: "cartline"
  delete 'cartlines/:id' => "cartlines#destroy", as: 'cartline_destroy'

  resources :releases, only: [:index, :show]
  get '/search/:id', to: 'releases#search', as: 'search'

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
