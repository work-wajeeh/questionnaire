# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#new'

  resources :questions, only: :index
  resources :tests, only: %i[new create]

  post '/submit', to: 'tests#submit'
  get '/result', to: 'tests#result'
  delete '/quit', to: 'tests#destroy'

  get '*path', to: redirect('/')
end
