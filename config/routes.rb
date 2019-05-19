Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
