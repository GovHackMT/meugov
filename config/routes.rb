Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, path: '', path_names: {sign_in: "acessar", sign_up: "registro", sign_out: "sair"}
  resources :comments
  resources :proposals do
    post :vote, on: :member
  end
  resources :cities
  resources :states
end
