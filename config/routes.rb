Rails.application.routes.draw do
  namespace :admin do
    resources :movies
    resources :columns
    resources :users
    root to: "movies#index"
  end

  devise_for :users
  resources :trainings
  root to: "graphs#index"
  resources :meals
  resources :movies
  resources :columns
  resources :graphs

  resource :graphs, only: %i[index create update]
end
