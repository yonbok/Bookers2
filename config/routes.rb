Rails.application.routes.draw do

  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:edit, :update]
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
