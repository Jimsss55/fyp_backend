class Api::Achievement::UserAchievementsController < ApplicationController

  # GET /user_achievements
  def index
    achievement = @current_user.achievements
    render json: achievement
  end

  # POST /user_achievements
  def create
    achievement = Achievement.find_by(name: params[:name])
    if achievement && !@current_user.achievements.include?(achievement)
      @current_user.achievements << achievement
      render json: { message: "Achievement Unlocked", achievement: achievement }, status: :created
    else
      render json: { message: "Achievement not found or this user does not have any achievement" }, status: :unprocessable_entity
    end
  end

  # DELETE /user_achievements/1
  def destroy
    @user_achievement.destroy!
  end
end
