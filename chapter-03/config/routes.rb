Rails.application.routes.draw do

  get 'password_resets/new'
  get 'password_resets/edit'
  resources :microposts
  root to:"microposts#index"
  
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/contact'
  
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/contact", to: "users#contacts"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :account_activations, only: :edit

  resources :password_resets, only: [:new, :create, :edit, :update]
  
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
