Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions"}

  root 'home#index'

  get 'home/about', to: "home#about", as: 'about'

  resources :users do
    resource :room do
      resources :messages
      resource :video
    end
  end

  mount ActionCable.server => '/cable'

end
