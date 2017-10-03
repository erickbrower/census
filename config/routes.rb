Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :update, :show, :destroy] do
        resources :exams, only: [:index, :create, :update, :show, :destroy]
        resources :sittings, only: [:index, :create, :update, :show, :destroy]
      end
      resources :sittings, only: [:index, :create, :update, :show, :destroy] do
        resources :responses, only: [:index, :create, :update, :show, :destroy]
      end
      resources :responses, only: [:index, :create, :update, :show, :destroy]
      resources :exams, only: [:index, :create, :update, :show, :destroy] do
        resources :questions, only: [:index, :create, :update, :show, :destroy]
        resources :sittings, only: [:index, :create, :update, :show, :destroy]
      end
      resources :questions, only: [:index, :create, :update, :show, :destroy] do
        resources :answers, only: [:index, :create, :update, :show, :destroy]
      end
      resources :answers, only: [:index, :create, :update, :show, :destroy]

      post 'authenticate' => 'authentication#authenticate'
    end
  end

  get '*path', to: 'pages#index', constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
