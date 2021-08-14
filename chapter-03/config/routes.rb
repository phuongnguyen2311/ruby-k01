Rails.application.routes.draw do
  
  scope "(:locale)", locale: /en|ja/ do
    resources :microposts do
      resources :comments
    end

    root to:"users#index"

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
  
    # match "/404", to: "errors#file_not_found", via: :all
    # match "/500", to: "errors#internal_server_error", via: :all

    resources :account_activations, only: :edit

    resources :password_resets, only: [:new, :create, :edit, :update]
  
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
