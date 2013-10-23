TaskDude::Application.routes.draw do
  resources :tasks
  root 'main#index'
end
