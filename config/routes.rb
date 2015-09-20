Rails.application.routes.draw do
  root 'dreams#index'

  resources :dreams
  resources :comments, except: [:show]
  post '/favorite/:dream_id' => 'favorites#create', as: 'favorite'
  delete '/favorite/:dream_id' => 'favorites#destroy', as: 'unfavorite'

  resources :dreamers, except: [:index, :show, :new, :destroy]
  get '/profile/:id' => 'dreamers#show', as: 'profile'
  get '/signup' => 'dreamers#new', as: 'signup'
  get '/welcome' => 'welcome#index', as: 'welcome'
  get '/search' => 'welcome#search'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/steps/new' => 'recipes#new_step', as: 'new_step'
  post '/recipes/steps' => 'recipes#create_step', as: 'create_step'
  get '/recipes/:id' => 'recipes#show', as: 'recipe'
  post '/steps/:id' => 'recipes#add_step', as: 'add_step'
  get '/steps/:id/edit' => 'recipes#edit_step', as: 'edit_step'
  patch '/steps/:id' => 'recipes#update', as: 'update_recipe_step'
  patch '/steps/:id/remove' => 'recipes#remove_step', as: 'remove_step'

  get '/twilio' => 'twilio#index'
  post '/send_sms' => 'twilio#send_sms'

end
