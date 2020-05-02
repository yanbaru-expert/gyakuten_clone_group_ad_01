Rails.application.routes.draw do
  devise_for :users

  root 'solitudes#index'

  resources :meals
  resources :movies
  resources :columns
  resources :graphs
  resources :solitudes
  resources :trainings

end
