Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/users", to: "users#index"

  # get "users/:id/", to: "users#show"
  # get "users/:user_id/posts", to: "posts#index"
  # get "users/:user_id/posts/:id", to: "posts#show"

  resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show] do
        resources :comments, only: [:index, :show]
        resources :likes, only: [:index, :show]
      end
  end
  # Defines the root path route ("/")
  root "users#index"
end
