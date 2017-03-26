Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions"}

  root 'home#index'

  get 'home/about', to: "home#about", as: 'about'

  resources :users do
    resource :room do
      resources :messages
    end
  end
  put 'rooms/:id', to: "rooms#update", as: "update_room"
end
