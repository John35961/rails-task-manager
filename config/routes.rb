Rails.application.routes.draw do
  authenticated :user do
    root to: 'tasks#index', as: 'index'
  end

  unauthenticated :user do
    root to: 'pages#home', as: 'home'
  end

  devise_for :users

  resources 'tasks'

  resources 'groups', only: %i[new create update edit destroy]
end
