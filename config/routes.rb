Rails.application.routes.draw do
  namespace :admin do
    resources :movies
    resources :columns
    resources :users
    root to: "movies#index"
  end

  devise_for :users, skip: :all
  resources :trainings
  root to: "graphs#index"
  resources :meals
  resources :movies
  resources :columns
  resources :graphs

  resource :graphs, only: %i[index create update]

  devise_scope :user do
    get "/users/sign_in", to: "users/sessions#new", as: :new_user_session
    post "/users/sign_in", to: "users/sessions#create", as: :user_session
    delete "/users/sign_out", to: "users/sessions#destroy", as: :destroy_user_session
    get "/users/password", to: "users/passwords#new", as: :new_user_password
    post "/users/password", to: "users/passwords#create", as: :user_password
    get "/users/edit", to: "users/registrations#edit", as: :edit_user_ragistration
    patch "/users", to: "users/registrations#update", as: :user_registration
    put "/users", to: "users/registrations#update", as: :put_user_registration
    delete "/users", to: "users/registrations#destroy", as: :delete_user_registration
    get "/users/password/edit", to: "users/passwords#edit", as: :edit_user_password
    put "/users/password", to: "users/passwords#update", as: :update_user_password
  end

  mount LetterOpenerWeb::Engine, at: "/lo" if Rails.env.development?
end
