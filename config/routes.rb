Rails.application.routes.draw do
  
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "users", only: [:create, :edit, :show, :update] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end


  #update "users/:id" => "users#update", as: "update"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
	root 'home#index'
end
