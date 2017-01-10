Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  root to: "home#show"

  resources :mailers, only: [:create]

  get "/sent", to: "mailers#sent"

end
