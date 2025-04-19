class Api::GuidedCategory::CategoriesController < ApplicationController
  def index
    @guided_category = GuidedCategory.all
    render json: @guided_category
  end

  def show
    guided_category = GuidedCategory.find(params[:id])
    render json: guided_category
  end

  def create
    guided_category = GuidedCategory.new(guided_category_params)
    if guided_category.save
      render json: guided_category, status: :created
    else
      render json: { error: guided_category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    guided_category = GuidedCategory.find(params[:id])
    if guided_category.update(guided_category_params)
      render json: guided_category
    else
      render json: { errors: guided_category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def guided_category_params
    params.require(:guided_category).permit(:name)
  end
end
