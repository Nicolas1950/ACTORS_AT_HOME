Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :actors do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:new, :create] do
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]
  resources :reviews, only: [:destroy]
  get 'dashboard', to: "pages#dashboard"
  get 'dashboard/review/new', to: "pages#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
