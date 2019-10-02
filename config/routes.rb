# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[create edit update destroy show index] do
    member do
      get :attendings
    end
  end

  resources :attendances, only: %i[create destroy]
  resources :sessions, only: %i[edit]
  resources :events do
    member do
      get :attendees
    end
  end

  root 'static_pages#landing_page'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#show'
  delete '/logout', to: 'sessions#destroy'
  get '/past_events', to: 'users#past'
  get '/upcoming_events', to: 'users#upcoming'
  get '/signup_confirmation', to: 'users#confirmation'
  get '/sessions_confirmation', to: 'sessions#confirmation'
end
