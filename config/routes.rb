Rails.application.routes.draw do
  root 'dreams#index'

  resources :dreams
  resources :comments, except: [:show]
  post '/favorite/:dream_id' => 'favorites#create', as: 'favorite'
  get '/favorite/:dream_id' => 'favorites#destroy', as: 'unfavorite'

  resources :dreamers, except: [:index, :show, :new, :destroy]
  get '/profile/:id' => 'dreamers#show', as: 'profile'
  get '/signup' => 'dreamers#new', as: 'signup'
  get '/welcome' => 'welcome#index', as: 'welcome'
  get '/search' => 'welcome#search'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :steps, except: [:destroy]
  post '/steps/:id' => 'steps#add_step', as: 'add_step'
  patch '/steps/:id/remove' => 'steps#remove_step', as: 'remove_step'

  get '/twilio' => 'twilio#index'
  post '/send_sms' => 'twilio#send_sms'

end
