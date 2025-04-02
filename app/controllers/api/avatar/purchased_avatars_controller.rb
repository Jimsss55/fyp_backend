class Api::Avatar::PurchasedAvatarsController < ApplicationController

  def index
    avatar_border = @current_user.avatar_borders
    render json: avatar_border
  end

  def create
    avatar_border = AvatarBorder.find_by(name: params[:name])

    if @current_user.purchased_avatars.exists?(avatar_border_id: avatar_border.id)
      return render json: { message: "You already own this avatar border" }, status: :unprocessable_entity
    end

    if @current_user.starCount > avatar_border.cost
      @current_user.starCount -= avatar_border.cost
      if @current_user.save
        @current_user.purchased_avatars.create(avatar_border: avatar_border)
        render json: { message: "Avatar border purchased successfully", avatar_border: avatar_border }, status: :created
      else
        render json: { message: "Failed to proceed purchase" }, status: :unprocessable_entity
      end
    else
      render json: { message: "Not enough stars to purchase this avatar border" }, status: :unprocessable_entity
    end
  end

  def destroy
    @avatar_border.destroy!
  end
end
