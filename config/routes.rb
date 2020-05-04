Rails.application.routes.draw do
  namespace :admin do
    resources :movies
    resources :columns
    resources :users
    root to: "movies#index"
  end

  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  resources :trainings
  root to: "graphs#index"
  resources :meals
  resources :movies
  resources :columns
  resources :graphs

  resource :graphs, only: %i[index create update]

  devise_scope :user do
    get "sign_in", to: "users/sessions#create"
    #    post "password", to: "users/passwords#create"
  end
end
