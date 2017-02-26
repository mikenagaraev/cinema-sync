Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  root 'home#index'

  get 'home/about', to: "home#about", as: 'about'

  resources :users do
    resources :rooms, only: [:new, :show, :patch, :destroy]
  end
  post 'users/:user_id/room', to: "rooms#create", as: "create_room"
end
