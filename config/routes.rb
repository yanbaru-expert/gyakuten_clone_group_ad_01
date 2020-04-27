Rails.application.routes.draw do

    namespace :admin do
      resources :trainings
      resources :meals
      resources :users
      root to: "trainings#index"
      
    end

    resources :trainings
    root to: "trainings#index"
    resources :meals
    resources :users
    resources :movies
    resources :columns

  end