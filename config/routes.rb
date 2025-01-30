Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  resources :products, only: %i[index show]
  # resources :shopping_cars, only: %i[index] do
  #   get '/products', action: "shopping_cars#products", on: :member
  # end
  resources :shopping_car_products, only: %i[create destroy update]

  # Defines the root path route ("/")
  # root "posts#index"
end
