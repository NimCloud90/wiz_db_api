Rails.application.routes.draw do
  get "sessions/create"
  get "players/create"
resources :players, :characters, only: [:index, :show, :create, :update, :destroy]

post 'login', to: 'sessions#create'
resources :users, only: [:create]
end
