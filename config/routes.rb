Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :comments
  resources :proposals do
    post :vote, on: :member
  end
  resources :cities
  resources :states
end
