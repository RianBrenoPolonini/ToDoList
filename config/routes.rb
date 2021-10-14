Rails.application.routes.draw do
  get 'sessions/new'
  resources :tasks
  resources :lists
  resources :users

  resources :lists, :has_many => :tasks

  root to: "sessions#new"

  get 'cadastro' , to: "users#new"
  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'sessions#create'
  delete 'sair'  => 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
