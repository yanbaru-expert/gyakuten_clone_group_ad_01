Rails.application.routes.draw do

    namespace :admin do
      resources :trainings
      resources :meals
      resources :users
      root to: "trainings#index"
      
    end
    
    devise_scope :admin do
      get '/admin/sign_out' => 'devise/sessions#destroy'
    end

    resources :trainings
    root to: "trainings#index"
    resources :meals
    resources :users

  end

