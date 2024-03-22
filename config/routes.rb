Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'index', to: 'users#index'
  get '/users/:id',to: 'users#show', as: 'user'
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/posts/:post_id/user', to: 'users#user_with_post', as: 'user_with_post' 


end
