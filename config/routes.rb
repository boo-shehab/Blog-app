Rails.application.routes.draw do
  resources :user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  
  resources :user, only: [:index, :show] do
    resources :post, only: [:index, :show]
  end
  
  get "/:id", to: 'user#show'
  
  get "post" => "post#index"
  
  get '/post/:id', to: 'post#show'
  
  root "user#index"

end
