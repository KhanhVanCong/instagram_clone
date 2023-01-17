Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root "home#index"

  post "toggle_like" => "likes#toggle_like"
end
