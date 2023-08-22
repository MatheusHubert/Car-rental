Rails.application.routes.draw do
  devise_for :users
  root to: "cars#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :cars, except: %I[index] do
    resources :bookings, only: %I[new create]
  end
  resources :bookings, only: %I[show index]

end
