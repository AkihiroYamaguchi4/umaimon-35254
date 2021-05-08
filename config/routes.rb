Rails.application.routes.draw do
  get 'home/index'
  devise_for :chefs, controllers: {
    sessions:      'chefs/sessions',
    passwords:     'chefs/passwords',
    registrations: 'chefs/registrations'
  }
   namespace :chefs do
    resources :courses, only: [:index , :new, :create]
     end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  namespace :users do
    resources :reservations, only: [:index , :new, :create]
  end


  root to: "home#index"
end
