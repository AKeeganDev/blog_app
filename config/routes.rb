# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      post '/login', to: 'authentication#login', default: {:format => :json}
      resources :users do
        get '/posts' => 'posts#index', as: :api_user_posts
        resources :posts do
          resources :comments

          post 'authenticate', to: 'authentication#create'
          
        end
      end
    end
  end
end
