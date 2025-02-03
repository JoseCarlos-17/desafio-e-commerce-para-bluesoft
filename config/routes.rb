Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations',
    sessions: 'auth/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  resources :products, only: %i[index show]
  # resources :shopping_cars, only: %i[index]
  resources :shopping_car_products, only: %i[index create destroy update]

  # Defines the root path route ("/")
  # root "posts#index"
end
