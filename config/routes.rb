OkStupid::Application.routes.draw do
  root :to => "site#root"

  namespace :api do
    resources :users, defaults: { format: :json }, only: [:index, :show] do
      resources :user_answers, defaults: { format: :json }
    end
    resource :detail, only: [:show], defaults: { format: :json }
    resource :session, only: [:show], defaults: { format: :json }
    resources :profiles, only: [:index, :show, :destroy, :update], defaults: { format: :json }
    resources :messages, only: [:show, :index, :create], defaults: { format: :json }
    resources :preferences, only: [:index, :create, :update], defaults: { format: :json }
    resources :matches, only: [:show, :index, :create], defaults: { format: :json }
    resources :likes, only: [:show], defaults: { format: :json }
    resources :questions, only: [:index], defaults: { format: :json }
    resources :answers, only: [:index], defaults: { format: :json }
  end

  resources :users, only: [:new, :create] do
  #   resources :messages, only: [:create, :show, :destroy, :index]
  #   resources :matches, only: [:create, :show]
  #   resource :profile, only: [:update]
  #   resource :preference, only: [:update]
  #   resources :likes, only: [:index, :create]
  #   resources :questions, only: [:index] do
  #     resources :answers, only: []
  #   end
  #   resources :user_answers, only: [:create]
  end
  resource :session, only: [:new, :create, :destroy]
end
