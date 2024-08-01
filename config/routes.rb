Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :index, :create, :destroy, :get]
  resources :users, only: [:new, :edit, :update]
end
