Rails.application.routes.draw do
  # create default routing
  # rails routes -c shifts to check
  
  resources :users
  

  scope "/auth" do
    post "/signup", to: "roles#create"
    post "/signin", to: "roles#sign_in"
    post "/staff_login", to: "employees#login"
    # post "/employee_login", to: employees#login
  end

  
  get "/employees", to: "employees#index"
  post "/staff_new", to: "employees#create"
  post "/staff_login", to: "employees#login"
  resources :employees
  
  
  get "/shifts/employee/:username", to: "shifts#employee_shifts"
  get "/shifts/date/:date", to: "shifts#date_shifts"
  get "/shifts", to: "shifts#index"
  get "/shifts/myshifts", to: "shifts#my_shifts"
  get "/shifts_current", to: "shifts#shifts_current"
  post "/shifts_new", to: "shifts#create"
  post "/shifts_update", to: "shifts#update"
  resources :shifts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
