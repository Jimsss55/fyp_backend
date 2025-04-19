require 'rails_helper'

RSpec.describe "Api::GuidedCategory::GuidedCategories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/guided_category/guided_category/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/guided_category/guided_category/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/guided_category/guided_category/create"
      expect(response).to have_http_status(:success)
    end
  end

end
