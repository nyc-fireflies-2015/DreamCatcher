Rails.application.routes.draw do
  resources :dreamers, except: [:index, :destroy]
  resources :dreams
  resources :favorites, only: [:create, :destroy]

  root 'dreams#index'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end
