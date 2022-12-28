# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#new'

  resources :questions, only: :index
  resources :tests, only: %i[new create destroy]

  get '/submit', to: 'tests#submit'
  get '/start', to: 'tests#start'
  get '/result', to: 'tests#result'
end
