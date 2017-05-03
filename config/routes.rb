Rails.application.routes.draw do
  root 'application#home'

  # get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  resources :tags
  resources :comments
  resources :images
  resources :events
  resources :users

# clean up
  resources :users, only: [:show] do
    resources :events, only: [:new, :index, :create, :show]
  end

  resources :events, only: [:show] do
    resources :images
  end

  resources :images, only: [:show] do
    resources :comments
  end

  resources :images, only: [:show] do
    resources :tags
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
