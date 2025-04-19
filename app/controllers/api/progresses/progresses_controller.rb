class Api::Progresses::ProgressesController < ApplicationController

  def create
    tracing = find_progressable

    if tracing.nil?
      render json: { error: "Invalid progressable type or Id " }, status: :bad_request
    end

    progress = Progress.find_or_initialize_by(
      user: @current_user,
      progressable: tracing
    )

    progress.completed = true

    if progress.save
      render json: { message: "Progress marked as completed", progress: progress }, status: :ok
    else
      render json: { errors: progress.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    progresses = @current_user.progresses.where(progressable_type: "GuidedTracing", completed: true)
    render json: progresses
  end

  private

  def find_progressable
    type = params[:progressable_type]
    id = params[:progressable_id]

    return nil unless [ "GuidedTracing" ].include?(type)
    type.constantize.find_by(id: id)
  rescue NameError
    nil
  end
end
