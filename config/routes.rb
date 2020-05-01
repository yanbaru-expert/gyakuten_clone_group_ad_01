Rails.application.routes.draw do
  resources :trainings

  root 'solitudes#index'
  resources :solitudes
end
