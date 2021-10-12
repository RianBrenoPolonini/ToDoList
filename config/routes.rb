Rails.application.routes.draw do
  resources :tasks
  resources :lists
  resources :users

  root to: "users#index"

  get 'cadastro' , to: "users#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
