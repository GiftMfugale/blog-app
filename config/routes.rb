Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources  :posts, only: [:index]
      end 
    end
  end

  root 'users#index'

  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    authenticated :user do
      root to: 'users#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get 'logout', to: 'sessions#user_logout', as: 'logout'

  get 'users', to: 'users#show'
  get '/users/:id',to: 'users#show', as: 'user'
  get '/users/:id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:id/posts/:id', to: 'posts#show', as: 'user_post'
  get '/posts/new_post', to: 'posts#new_post', as: 'new_post'
  post '/posts', to: 'posts#create_post', as: 'create_post'
  get 'posts/:id', to: 'posts#edit_post', as: 'edit_post'
  patch 'posts/:id/update_post', to: 'posts#update_post', as: 'update_post'
  delete 'posts/:id', to: 'posts#delete_post', as: 'delete_post'
  post '/posts/:id/comments', to: 'comments#create_comment', as: 'post_comments'
  get 'posts/:id/likes', to: 'likes#add_like', as: 'add_likes'



end
