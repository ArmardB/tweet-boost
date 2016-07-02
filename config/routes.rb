Rails.application.routes.draw do
  
  devise_for :users

  root 'search#index'

  # Searches Routes
  resources :searches, only: [:index, :create]
  post "searches/create" => "searches#create", as: "favorite"

  # Sessions Routes
  get "/auth/twitter/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :logout
end
