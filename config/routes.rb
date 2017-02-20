Rails.application.routes.draw do


  get '/signin', to: 'sessions#new'

  post '/signin', to: 'sessions#create' 

  get '/signout', to: 'sessions#destroy'

  # get 'sessions/new'

  get 'attractions/new'

  get 'attractions/index'

  get 'attractions/show'

  get 'attractions/create'

  get 'attractions/update'

  # get 'users/update'

  # get 'users/index'

  # get 'users/new'

  # get 'users/create'

  # get 'users/show'

  # get 'users/destroy'

  root to: 'users#index'
  resources :users

end