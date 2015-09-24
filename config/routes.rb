require 'sidekiq/web'
Rails.application.routes.draw do
  root 'dreams#index'

  get '/hashtags/:id/dreams' => 'hashtags#index', as: 'hashtag_dreams'
  delete '/dreams/:dream_id/hashtag/:id' => 'hashtags#destroy', as: 'hashtag'
  resources :dreams
  resources :comments, except: [:show]

  get 'conversations/shortpoll/:id' => 'conversations#shortpoll', as: "conversation_shortpoll"
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
  get '/dreamers/:id/reality_check' => 'dreamers#reality_check', as: 'reality_check'
  get '/dreamers/:id/inbox' => 'dreamers#inbox', as: 'inbox'
  get '/profile/:id' => 'dreamers#show', as: 'profile'
  get '/signup' => 'dreamers#new', as: 'signup'
  get '/welcome' => 'welcome#index', as: 'welcome'
  get '/search' => 'welcome#search'

  post '/sessions' => 'sessions#create'
  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'

  resources :steps, except: [:index]
  get 'dreamers/:id/steps' => 'steps#recipe', as: 'recipe'
  post '/steps/:id' => 'steps#clone', as: 'clone'

  get '/twilio' => 'twilio#index'
  post '/send_sms' => 'twilio#send_sms'


  put '/reality_check' => 'twilio#reality_check'
  mount Sidekiq::Web, at: '/sidekiq'
  get '/shortpoll' => 'dreams#shortpoll'
end
