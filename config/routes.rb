Rails.application.routes.draw do
  root "users#new"
  resources :users do
    resource :profile, only: [:update]
    resource :preference, only: [:update]
    resources :user_answers
  end
  resource :session, only: [:new, :create, :destroy]

  resources :questions, only: [:index] do
    resources :answers
  end
end
