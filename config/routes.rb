Rails.application.routes.draw do
  devise_for :users

  post "toggle_like" => "likes#toggle_like"
  resources :posts

  resources :comments, only: [:create, :destroy]
  resources :users, only: :show

  root "home#index"
end
