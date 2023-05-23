Rails.application.routes.draw do
  root to: "homes#top"
  get 'homes/about' => 'homes#about'
  
  resources :books, only: [:new, :create, :index, :show, :destroy]
  devise_for :users
  resources :users, only: [:edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
