Rails.application.routes.draw do
  devise_for :users
  root "events#index"

  resources :events
  resources :users, only: [:show]
  resources :event_attendances, only: [:create, :destroy]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
