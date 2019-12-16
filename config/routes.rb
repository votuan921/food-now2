Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: "home_pages#index"
  post "/update_cart", to: "carts#update"
  get "/destroy_cart", to: "carts#destroy"
  get "/show_order", to: "orders#show"
  post "/payment", to: "orders#create"
  get "/checkout", to: "orders#checkout"
  get "/order_confirmed", to: "orders#order_confirmed"
  get "/submit_store", to: "home_pages#submit_store"
  post "/submit_store", to: "stores#submit_store"
  
  resources :orders, only: %i(index)
  resources :carts, only: %i(create)
  resources :products, only: %i(index)
  resources :combos, only: %i(index)
  resources :stores, only: %i(show) do
    get "/detail_page", to: "stores#detail_page"
    post "/comment", to: "stores#create_comment"
  end
  resources :stores, only: :show

  get "/searchs", to: "home_pages#search_store"
end
