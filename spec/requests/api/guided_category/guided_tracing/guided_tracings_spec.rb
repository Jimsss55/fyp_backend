require 'rails_helper'

RSpec.describe "Api::GuidedCategory::GuidedTracing::GuidedTracings", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/guided_category/guided_tracing/guided_tracings/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/guided_category/guided_tracing/guided_tracings/update"
      expect(response).to have_http_status(:success)
    end
  end

end
