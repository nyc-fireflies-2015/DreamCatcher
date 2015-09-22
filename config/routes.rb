Rails.application.routes.draw do
  root 'dreams#index'

  patch '/dreams/:id/hashtags' => 'dreams#remove_hashtag', as: 'remove_hashtag'
  resources :dreams
  resources :comments, except: [:show]
  resources :conversations, only: [:index, :show, :destroy] do
    collection do
      delete :empty_trash
    end

    member do
      post :restore
      post :reply
      post :mark_as_read
    end
  end
  resources :messages, only: [:new, :create]
  post '/favorite/:dream_id' => 'favorites#create', as: 'favorite'
  delete '/favorite/:dream_id' => 'favorites#destroy', as: 'unfavorite'

  resources :dreamers, except: [:index, :show, :new, :destroy]
  get '/dreamers/:id/setting' => 'dreamers#setting', as: 'setting'
  get '/dreamers/:id/inbox' => 'dreamers#inbox', as: 'inbox'
  get '/profile/:id' => 'dreamers#show', as: 'profile'
  get '/signup' => 'dreamers#new', as: 'signup'
  get '/welcome' => 'welcome#index', as: 'welcome'
  get '/search' => 'welcome#search'

  post '/sessions' => 'sessions#create'
  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'

  resources :steps, except: [:destroy, :index]
  get 'dreamers/:id/steps' => 'steps#recipe', as: 'recipe'
  post '/steps/:id' => 'steps#add_step', as: 'add_step'
  patch '/steps/:id/remove' => 'steps#remove_step', as: 'remove_step'

  get '/twilio' => 'twilio#index'
  post '/send_sms' => 'twilio#send_sms'

end
