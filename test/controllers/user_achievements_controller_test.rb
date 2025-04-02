require "test_helper"

class UserAchievementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_achievement = user_achievements(:one)
  end

  test "should get index" do
    get user_achievements_url, as: :json
    assert_response :success
  end

  test "should create user_achievement" do
    assert_difference("UserAchievement.count") do
      post user_achievements_url, params: { user_achievement: {} }, as: :json
    end

    assert_response :created
  end

  test "should show user_achievement" do
    get user_achievement_url(@user_achievement), as: :json
    assert_response :success
  end

  test "should update user_achievement" do
    patch user_achievement_url(@user_achievement), params: { user_achievement: {} }, as: :json
    assert_response :success
  end

  test "should destroy user_achievement" do
    assert_difference("UserAchievement.count", -1) do
      delete user_achievement_url(@user_achievement), as: :json
    end

    assert_response :no_content
  end
end
