Rails.application.routes.draw do
   devise_for :users
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

   # Defines the root path route ("/")
   # root "articles#index"
   root to: "groups#index"
   resources :groups, only: [:index, :create, :new] do
      resources :accounts, only: [:index, :create, :new]
   end
end
