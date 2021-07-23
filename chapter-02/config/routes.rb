Rails.application.routes.draw do
  resources :microposts
  root to:"microposts#index"
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/contact'
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end