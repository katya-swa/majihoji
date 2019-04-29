Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get  '/about',   to: 'pages#about'
  resources :users, only: %i(index show)
  resources :items do
    resources :comments
  end
end
