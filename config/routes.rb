Rails.application.routes.draw do

  get 'player_teams/new'
  resources :players, only: [:index, :show]
  resources :leagues, except: [:index, :edit, :update]
  resources :users, only: [:new, :create, :destroy]
  resources :teams
  resources :rankings
  resources :player_teams, only: [:new, :destroy]

  get '/teams/:id/optimal', to: 'teams#optimal', as: 'optimal'

  get '/login', to: 'users#login', as: 'login'
  post '/login', to: 'users#handle_login'
  delete '/logout', to: 'users#logout'

end
