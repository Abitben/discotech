require 'rails_helper'

RSpec.describe "Wishlists", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/wishlist/index"
      expect(response).to have_http_status(:success)
    end
  end

end
