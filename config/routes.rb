Rails.application.routes.draw do
  root "users#new"
  resources :users do
    resource :profile, only: [:update]
    resource :preference, only: [:update]
    resources :likes, only: [:index, :create]
    resources :questions, only: [:index] do
      resources :answers, only: []
    end
    resources :user_answers, only: [:create]
  end
  resource :session, only: [:new, :create, :destroy]


end
