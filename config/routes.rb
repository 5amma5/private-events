Rails.application.routes.draw do
  # get "users/:id" => 'users#show'
  root "events#index"
  devise_for :users
  resources :events, only: [:index, :new, :create, :show]
  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
