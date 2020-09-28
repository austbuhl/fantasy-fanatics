Rails.application.routes.draw do

  resources :players, only: [:index, :show]
  resources :leagues, except: [:edit, :update]
  resources :users, only: [:new, :create, :destroy]
  resources :teams
  resources :rankings

  get '/login', to: 'users#login', as: 'login'
  post '/login', to: 'users#handle_login'
  delete '/logout', to: 'users#logout'
  
end
