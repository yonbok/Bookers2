Rails.application.routes.draw do
  root to: "home#top"
  devise_for :users
  get 'home/about' => 'home#about'

  resources :books, only: [:update, :create, :index, :show, :edit, :destroy]
  resources :users, only: [:edit, :update, :show, :index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
