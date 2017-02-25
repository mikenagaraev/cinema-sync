Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  root 'home#index'

  get 'home/about', to: "home#about", as: 'about'

  resources :users do
    resource :room, only: [:new, :show, :patch, :delete]
  end
  post 'users/:user_id/room', to: "rooms#create", as: "create_room"
end
