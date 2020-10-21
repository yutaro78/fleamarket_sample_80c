Rails.application.routes.draw do
  devise_for :users
  #get 'tops/index'
  root 'tops#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  resources :items, only: [:index, :new, :create]
end
