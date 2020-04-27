Rails.application.routes.draw do
  devise_for :users
  resources :trainings
  root to: "trainings#index"
  resources :meals
  resources :movies
  resources :columns
  resources :graphs
end
