Rails.application.routes.draw do
  #  root to: "restaurants#index"
   devise_for :users
   get 'about', to: 'pages#aboutus'
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root to: "restaurants#index"

  resources :users, only: [ :show, :new, :create, :destroy ] do
    resources :reviews, only: :create
  end

  resources :restaurants do
    resources :bookings, only: [ :create, :new ]
    resources :reviews
  end

  resources :bookings, only: [ :show, :destroy, :index ]


  resources :categories, except: [ :edit, :update ]
end
