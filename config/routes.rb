Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :guided_category do
      namespace :guided_tracing do
        get "guided_tracings/index"
        get "guided_tracings/update"
      end
      get "guided_category/index"
      get "guided_category/show"
      get "guided_category/create"
    end
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
      get "/", to: "achievements#index"
    end

    namespace :avatar do
      get "/purchased_avatar", to: "purchased_avatars#index"
      post "/purchased_avatar", to: "purchased_avatars#create"
      get "/", to: "avatar_borders#index"
    end

    namespace :progresses do
      post "/", to: "progresses#create"
      get "/", to: "progresses#index"
    end

    namespace :guided_category do
      resources :categories, only: [ :index, :show, :create, :update ] do
        namespace :guided_tracing do
          resources :tracings, only: [ :index, :create ]
        end
      end
    end

    namespace :guided_tracing do
      get "/", to: "guided_tracings#index"
    end
  end
end
