class Api::Feedback::FeedbacksController < ApplicationController
  before_action :authenticate_user

  # Fetch all the feedbacks for admin
  def index
    if @current_user.admin?
      feedback = Feedback.order(Arel.sql("CASE WHEN status = #{Feedback.statuses[:viewed]} THEN 1 ELSE 0 END"),
                                created_at: :desc)
      render json: feedback, status: :ok
    else
      render json: { error: "Unauthorized" }, status: :forbidden
    end
  end

  # Create feedback for users
  def create
    feedback = @current_user.feedbacks.build(feedback_params)
    if feedback.save
      render json: { message: "Feedback submitted successfully", feedback: feedback }, status: :created
    else
      render json: { errors: feedback.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    feedback = Feedback.find(params[:id])
    if feedback&.update(feedback_params)
      render json: feedback, status: :ok
    else
      render json: { error: "Failed to update user feedback" }, status: :unprocessable_entity
    end
  end

  # def authenticate_user
  #   token = request.headers["Authorization"]&.split(" ")&.last
  #   if token
  #     begin
  #       decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: "HS256")
  #       @current_user = ::User.find_by(id: decoded_token[0]["user_id"])
  #
  #       unless @current_user
  #         render json: { error: "Unauthorized: User not found" }, status: :unauthorized
  #       end
  #     rescue JWT::DecodeError
  #       render json: { error: "Unauthorized: Token not found" }, status: :unauthorized
  #     end
  #   else
  #     render json: { error: "Unauthorized: No token provided" }, status: :unauthorized
  #   end
  # end

  private
  def feedback_params
    params.require(:feedback).permit(:message, :status)
  end
end
