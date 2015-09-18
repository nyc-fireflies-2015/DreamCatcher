Rails.application.routes.draw do
  resources :dreams
  resources :favorites, only: [:create, :destroy]

  resources :dreamers, except: [:index, :show, :destroy]
  get '/profile/:id' => 'dreamers#show', as: 'profile'

  root 'dreams#index'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
