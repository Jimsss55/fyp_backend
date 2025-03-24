Rails.application.routes.draw do
  resources :users

  namespace :auth do
    post "register", to: "authentication#register"
    post "login", to: "authentication#login"
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
