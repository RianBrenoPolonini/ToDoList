Rails.application.routes.draw do
 
  root to: "sessions#new"

  resources :users
  resources :lists do
    resources :tasks
  end

  get 'sessions/new'
  get 'cadastro' , to: "users#new"
  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'sessions#create'
  delete 'sair'  => 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
