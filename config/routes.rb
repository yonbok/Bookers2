Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get 'home/about' => 'homes#about'

  resources :books, only: [:update, :create, :index, :show, :edit, :destroy]
  resources :users, only: [:edit, :update, :show, :index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
