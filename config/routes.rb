Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources 'tasks'

  resources 'groups', only: %i[new create update edit destroy]
end
