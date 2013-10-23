TaskDude::Application.routes.draw do
  resources :tasks
  resource :tasks
  root 'main#index'
end
