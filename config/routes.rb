Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    # User
    namespace :user do
      resources :users
    end

    # Feedback
    namespace :feedback do
      get "admin", to: "feedbacks#index"
      post "user", to: "feedbacks#create"
      patch ":id", to: "feedbacks#update"
    end


    # Authentication
    namespace :auth do
      # Registration
      post "registration", to: "authentication#register"

      # Login
      post "/admin/login", to: "authentication#login"
      post "/user/login", to: "authentication#user_login"
    end

    namespace :achievement do
      get "/user_achievement", to: "user_achievements#index"
      post "/user_achievement", to: "user_achievements#create"
    end

    namespace :avatar do
      get "/purchased_avatar", to: "purchased_avatars#index"
      post "/purchased_avatar", to: "purchased_avatars#create"
    end
  end
end
