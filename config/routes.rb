Rails.application.routes.draw do
 
  root to: "sessions#new"

  resources :users
  resources :lists do
    resources :tasks
  end

  get 'cadastro' , to: "users#new"
  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'sessions#create'
  delete 'sair'  => 'sessions#destroy'
  post 'update_status/:id', to: 'tasks#update_status', as: 'update_status'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
