Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  root 'home#index'

  get 'home/about', to: "home#about", as: 'about'

  resources :users
  resources :rooms, only: [:create, :new, :show, :patch, :destroy]
end
