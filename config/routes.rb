Rails.application.routes.draw do
  
  get 'braintree/new'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "users", only: [:create, :edit, :show, :update] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
    resources :listings, only: [:show]
  end
    resources :listings do
      resource :verify, only: %w(update destroy)
      # member do
      #   put 'verify'
      # end
      resources :bookings
    end

#nested routes suck
  post 'braintree/checkout'
  get "/users/:id/bookings" => "bookings#index", as: "show_all_booking"
  get "/users/:id/bookings/:booking_id" => "bookings#user_show", as: "show_user_booking"
  get "/users/:user_id/listings" => "listings#user_listing", as: "show_user_listing"
  get "/listings" => "listings#all", as: "all_listing"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
	root 'home#index'
end
