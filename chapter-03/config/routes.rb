Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ja/ do
    resources :microposts
    root to:"microposts#index"

    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/contact", to: "users#contacts"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/logout", to: "sessions#destroy"
    get 'password_resets/new'
    get 'password_resets/edit'
    
    get 'static_pages/home'
    get 'static_pages/help'
    get 'static_pages/contact'
  
    resources :account_activations, only: :edit

    resources :password_resets, only: [:new, :create, :edit, :update]
  
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
