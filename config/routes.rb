Rails.application.routes.draw do
  root 'application#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  resources :tags
  resources :comments
  resources :images
  resources :events
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
