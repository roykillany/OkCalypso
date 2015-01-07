Rails.application.routes.draw do
  root "users#new"
  resources :users do
    resource :profile, only: [:update]
    resource :preference, only: [:update]
  end
  resource :session, only: [:new, :create, :destroy]
end
