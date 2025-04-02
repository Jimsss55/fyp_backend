require "pry"
module  Api
  module Auth
    class AuthenticationController < ApplicationController
      User = ::User
      skip_before_action :authenticate_request, only: [ :register, :login, :user_login ]

      def register
        user = User.new(user_params)
        if user.save
          token = jwt_encode(user_id: user.id)
          render json: { user: user, token: token }, status: :created
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      def login
        user = User.find_by(username: params[:username])

        if user&.authenticate(params[:password])
          if user.admin?
            access_token = jwt_encode({ user_id: user.id, exp: 1.hours.from_now.to_i })
            refresh_token = jwt_encode({ user_id: user.id, exp: 7.days.from_now.to_i })

            render json: {
              user: user,
              access_token: access_token,
              refresh_token: refresh_token
            }, status: :ok
          else
            render json: { error: "Invalid username or password" }, status: :unauthorized
          end
        end
      end

      def user_login
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password]) && user.role_id ==1
            access_token = jwt_encode({ user_id: user.id, exp: 30.minutes.from_now.to_i })
            refresh_token = jwt_encode({ user_id: user.id, exp: 7.days.from_now.to_i })

            render json: { user: user, access_token: access_token, refresh_token: refresh_token }, status: :ok
        else
          render json: { error: "Unauthorized: Only users can log in" }, status: :unauthorized
        end
      end



      # def logout
      #   render json: { message: "Logged out successfully" }, status: :ok
      # end

      private
      def user_params
        params.require(:user).permit(:username, :password, :gender, :dob)
      end
      def jwt_encode(payload)
        JWT.encode(payload, Rails.application.credentials.secret_key_base)
      end
    end
  end
end
