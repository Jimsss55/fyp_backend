require "jwt"
require "pry"

module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request
  end

  def authenticate_request
    header = request.headers["Authorization"]
    token = header.split(" ").last if header
    # binding.pry
    begin
      decoded = JWT.decode(token, Rails.application.credentials.secret_key_base)
      @current_user = User.find(decoded[0]["user_id"])
    rescue JWT::DecodeError
      render json: { error: "unauthorized" }, status: :unauthorized
    end
  end
end
