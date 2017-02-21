Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  root 'home#index'

  resources :users do
    resource :room
  end
end
