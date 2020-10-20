Rails.application.routes.draw do
  #get 'tops/index'
  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  resources :items, only: :new
end
