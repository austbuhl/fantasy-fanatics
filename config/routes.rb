Rails.application.routes.draw do
  root 'users#login'
  get 'player_teams/new'
  resources :players, only: [:index, :show]
  resources :leagues, except: [:edit, :update]
  resources :users, only: [:new, :create, :destroy]
  resources :teams
  resources :rankings, except: [:edit, :update]
  resources :player_teams, only: [:new, :destroy, :create]

  get '/teams/:id/optimal', to: 'teams#optimal', as: 'optimal'

  get '/login', to: 'users#login', as: 'login'
  post '/login', to: 'users#handle_login'
  delete '/logout', to: 'users#logout'

end
