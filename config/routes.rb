Rails.application.routes.draw do
  devise_for :users
root 'pages#home'
  get  '/about',   to: 'pages#about'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users', to: 'users#index'
end
