class Api::Avatar::AvatarBordersController < ApplicationController
  before_action :set_avatar_border, only: %i[ show update destroy ]

  # GET /achievements
  def index
    @avatar_border = AvatarBorder.all
    render json: @avatar_border
  end

  def show
    render json: @avatar_border
  end

  # POST /achievements
  def create
    @avatar_border = AvatarBorder.new(avatar_border_params)

    if @avatar_border.save
      render json: @avatar_border, status: :created, location: @avatar_border
    else
      render json: @avatar_border.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /achievements/1
  def update
    if @avatar_border.update(avatar_border_params)
      render json: @avatar_border
    else
      render json: @avatar_border.errors, status: :unprocessable_entity
    end
  end

  # DELETE /achievements/1
  def destroy
    @avatar_border.destroy!
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_avatar_border
    @avatar_border = AvatarBorder.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def avatar_border_params
    params.permit(:avatar_border).permit(:name, :cost)
  end
end
