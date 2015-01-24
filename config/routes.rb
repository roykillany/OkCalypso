OkStupid::Application.routes.draw do
  root :to => "sites#root"

  namespace :api, defaults: { format: :json } do
    resources :searches, only: [:index]
    resources :users, only: [:index, :show, :new, :create, :update, :guest_create] do
      resources :user_answers
    end
    post '/guestuser', to: 'users#guest_create'
    resource :detail, only: [:show]
    resource :session, only: [:show, :create, :new, :destroy]
    resources :profiles, only: [:index, :show, :destroy, :update]
    resources :messages, only: [:show, :index, :create]
    resources :preferences, only: [:index, :create, :update]
    resources :matches, only: [:show, :index, :create]
    resources :likes, only: [:show, :create, :index, :destroy]
    resources :questions, only: [:index]
    resources :answers, only: [:index]
  end

  get "auth/:provider/callback" => "api/sessions#omniauth"

  # resources :users, only: [:new, :create] do
  #   resources :messages, only: [:create, :show, :destroy, :index]
  #   resources :matches, only: [:create, :show]
  #   resource :profile, only: [:update]
  #   resource :preference, only: [:update]
  #   resources :likes, only: [:index, :create]
  #   resources :questions, only: [:index] do
  #     resources :answers, only: []
  #   end
  #   resources :user_answers, only: [:create]
  # end
  # resource :session, only: [:new, :create, :destroy]
end
