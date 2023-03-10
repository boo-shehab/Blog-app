Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  root "user#index"

  resources :user, only: [:index, :show] do
    resources :post, only: [:index, :show, :new, :create] do
      resources :comment, only: [:new, :create] 
      resources :like, only: [:create] 
    end
  end

end
