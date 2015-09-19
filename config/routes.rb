Rails.application.routes.draw do
  root 'dreams#index'

  resources :dreams
  resources :favorites, only: [:create, :destroy]

  resources :dreamers, except: [:index, :show, :new, :destroy]
  get '/profile/:id' => 'dreamers#show', as: 'profile'
  get '/signup' => 'dreamers#new', as: 'signup'
  get '/welcome' => 'welcome#index', as: 'welcome'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/recipes/:id' => 'recipes#show', as: 'recipe'
  get '/recipes/:id/edit' => 'recipes#edit', as: 'edit_recipe'
  patch '/recipes/:id' => 'recipes#update', as: 'update_recipe'

  get '/twilio' => 'twilio#index'
  post '/send_sms' => 'twilio#send_sms'

end
