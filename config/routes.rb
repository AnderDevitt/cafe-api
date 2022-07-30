Rails.application.routes.draw do
  # create default routing
  # rails routes -c shifts to check
  resources :shifts
  resources :users

  scope "/auth" do
    post "/signup", to: "roles#create"
    post "/signin", to: "roles#sign_in"
  end

  get "/employees", to: "employees#index"
  post "/staff_new", to: "employees#create"
  post "/staff_login", to: "employees#login"
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
