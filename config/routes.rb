Rails.application.routes.draw do
  root to: "cars#index"

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  
  devise_for :users

  resources :cars, except: %I[index] do
    resources :bookings, only: %I[new create]
  end
  resources :bookings, only: %I[show index]

end
