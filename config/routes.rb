Rails.application.routes.draw do
  devise_for :users
root 'pages#home'
  get  '/about',   to: 'pages#about'
  get '/users/:id' => 'users#show'
end
