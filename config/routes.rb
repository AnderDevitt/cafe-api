Rails.application.routes.draw do
  # create default routing
  # rails routes -c shifts to check
  resources :shifts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
