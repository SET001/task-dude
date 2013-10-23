TaskDude::Application.routes.draw do
  resources :tasks
  resource :tasks
  root 'main#index'

  get 'subtasks/:id', to: 'tasks#subtasks'
end
