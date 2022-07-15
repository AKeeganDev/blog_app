# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end

  # get '/users/:user_id/posts' => 'posts#index', as: :user_posts
  # post 'posts/create' => 'posts#create', as: :create_user_post
  # get '/users/:user_id/posts/new' => 'posts#new', as: :new_user_post
  # get '/users/:user_id/posts/:id' => 'posts#show', as: :user_post
  # get '/users' => 'users#index', as: :users
  # get '/users/:id' => 'users#show', as: :user
  # post 'likes/create' => 'likes#create', as: :create_user_post
end
