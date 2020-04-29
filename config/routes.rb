Rails.application.routes.draw do

    namespace :admin do
      resources :trainings
      resources :meals
      resources :users
      root to: "trainings#index"
      
    end

  devise_for :users
  resources :trainings
  root to: "graphs#index"
  resources :meals
  resources :movies
  resources :columns
  resources :graphs
end
