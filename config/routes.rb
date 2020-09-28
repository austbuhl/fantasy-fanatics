Rails.application.routes.draw do
  
  resources :players, only: [:index, :show]
  resources :leagues, except: [:edit, :update]
  resources :users, only: [:new, :create, :destroy]
  resource :teams
  resouces :rankings
end
