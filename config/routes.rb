Rails.application.routes.draw do
  devise_for :users
  root to: 'yachts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :yachts, except: :destroy do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [ :new, :create ]
  end
  resources :bookings, only: [:show, :index]
  resources :reviews, only: [ :destroy ]
end
