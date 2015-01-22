Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
  get 'signin' => 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :tweets, only: [:index, :new, :create]
  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:index, :show]

  root to: 'static_pages#home'
end
