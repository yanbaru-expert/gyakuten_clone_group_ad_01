Rails.application.routes.draw do

  resources :trainings
  root to: "trainings#index"
  resources :meals
end
