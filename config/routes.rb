Rails.application.routes.draw do
  get 'watch/search'

  resources :examples
  # get 'movie/index'
  # get 'movie/new'
  # get 'movie/show'
  # get 'movie/edit'
  # get 'movie/update'
  # get 'movie/delete'

  resources :movies
  resources :posts
  resources :favorite
  resources :mention

  # post 'movie_post/create'

  get '/search_movie', to: 'welcome#search_movies', as: 'search_movies'
  get '/clear_search', to: 'welcome#clear_search', as: 'clear_search'
  get '/flops', to: 'welcome#get_popular_flops', as: 'flops'
  get '/favorites', to: 'welcome#get_user_favorites', as: 'favorites'
  get '/recommendations', to: 'welcome#recommendations', as: 'recommendations'
  get 'watch', to: 'watch#search'
  post '/favorite', to: 'favorites#create'

  # get 'password/edit'
  # get 'password/update'
  # get 'session/new'
  # get 'session/create'
  # get 'session/destroy'
  # get 'registration/new'
  # get 'registration/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'welcome#index'

  # sign in, sign up and sessions routes
  get     'sign_up',              to: 'registration#new'
  post    'sign_up',              to: 'registration#create'
  get     'sign_in',              to: 'session#new'
  post    'sign_in',              to: 'session#create', as: 'log_in'
  delete  'logout',               to: 'session#destroy'
  get     'password',             to: 'password#edit', as: 'edit_password'
  patch   'password',             to: 'password#update'
  get     'password/reset',       to: 'password_reset#new'
  post    'password/reset',       to: 'password_reset#create'
  get     'password/reset/edit',  to: 'password_reset#edit'
  patch   'password/reset/edit',  to: 'password_reset#update'

end
