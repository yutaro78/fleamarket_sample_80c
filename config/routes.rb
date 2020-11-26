Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end

  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  resources :purchases, only: :index
  
  resources :items do
    collection do
      get :search_category
    end
  end

  resources :pays, only: [:new, :show,:create ] do
    collection do
      post 'delete', to: 'pays#delete'
    end
  end

end
