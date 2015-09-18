Rails.application.routes.draw do
  root 'dreams#index'

  resources :dreams
  resources :favorites, only: [:create, :destroy]

  resources :dreamers, except: [:index, :show, :new, :destroy]
  get '/profile/:id' => 'dreamers#show', as: 'profile'
  get '/signup' => 'dreamers#new', as: 'signup'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
