Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :admin do
    get 'users/new'
    get 'users/edit'
    get 'users/show'
    get 'users/index'
  end

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root 'pages#home'
  get  '/about',   to: 'pages#about'
  resources :users, only: %i(index show)
  resources :items do
    resources :comments
  end
end
