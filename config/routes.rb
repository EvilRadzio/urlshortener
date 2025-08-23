Rails.application.routes.draw do
  resources :shortened_urls
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :update, :destroy] do
    patch :rotate_api_key, on: :member
  end
  resources :shortened_urls, only: [:create, :destroy]
  get "/:short_url", to: "redirects#show", 
    constraints: { short_url: /[A-Za-z0-9]{9}/ }, 
    as: :redirect  
end
