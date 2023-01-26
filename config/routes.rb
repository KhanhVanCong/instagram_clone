Rails.application.routes.draw do
  devise_for :users

  post "toggle_like" => "likes#toggle_like"
  resources :posts

  resources :comments, only: [:create, :destroy]
  resources :users, only: [:show, :index]

  post "follow" => "follows#follow"
  delete "unfollow" => "follows#unfollow"
  delete "cancel_request" => "follows#cancel_request"
  post "accept_follow" => "follows#accept_follow"
  delete "decline_follow" => "follows#decline_follow"

  root "home#index"
end
