Rails.application.routes.draw do
  devise_for :customers
  resources :categories, only: %i[index show]
  resources :products, only: %i[index show]
  resources :cart, only: %i[create destroy show update]
  get "search", to: "products#search", as: "search"

  root to: "products#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
