OkStupid::Application.routes.draw do
  root :to => "site#root"

  namespace :api do
    resources :profiles, only: [:index, :show, :destroy]
    resources :messages
    resources :preferences
    resources :matches
    resources :likes
  end

  resources :users do
    resources :messages, only: [:create, :show, :destroy, :index]
    resources :matches, only: [:create, :show]
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
