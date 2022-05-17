Rails.application.routes.draw do
  devise_for :users,
  controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/users", to: "users#index"

  # get "users/:id/", to: "users#show"
  # get "users/:user_id/posts", to: "posts#index"
  # get "users/:user_id/posts/:id", to: "posts#show"

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[new create]
    end
  end
  # Defines the root path route ("/")
  root 'users#index'
end
