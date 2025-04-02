require 'rails_helper'

RSpec.describe "Api::AvatartBorders", type: :request do
  describe "GET /avatar_borders" do
    it "returns http success" do
      get "/api/avatart_border/avatar_borders"
      expect(response).to have_http_status(:success)
    end
  end

end
