Rails.application.routes.draw do
  namespace :admin do
    resources :movies
    resources :columns
    resources :users
    root to: "movies#index"
  end

  devise_for :users

  root "solitudes#index"

  resources :meals
  resources :movies
  resources :columns
  resources :graphs
  resources :solitudes
  resources :trainings
  resource :graphs, only: %i[index create update]
end
