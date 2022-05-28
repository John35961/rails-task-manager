Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'tasks/new', to: 'tasks#new', as: :new_task

  get 'tasks/:id', to: 'tasks#show', as: :task

  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task

  post 'tasks', to: 'tasks#create'

  patch 'tasks/:id', to: 'tasks#update'

  delete 'tasks/:id', to: 'tasks#destroy'
end
