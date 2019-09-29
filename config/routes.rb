Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[create edit update destroy show]
  resources :sessions, only: %i[edit]
  resources :events

  root 'static_pages#landing_page'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#show'
  delete '/logout', to: 'sessions#destroy'

end
