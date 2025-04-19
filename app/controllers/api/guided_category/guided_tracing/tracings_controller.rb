class Api::GuidedCategory::GuidedTracing::TracingsController < ApplicationController
  def index
    category = GuidedCategory.find(params[:category_id])
    tracings = category.guided_tracings
    render json: tracings
  end

  # If admin wants to add a new tracing tasks
  def create
    category = GuidedCategory.find(params[:guided_category_id])
    tracing = category.guided_tracings.new(tracing_params)

    if tracing.save
      render json: tracing, status: :created
    else
      render json: { errors: tracing.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def tracing_params
    params.require(:guided_tracing).permit(:completed)
  end
end
