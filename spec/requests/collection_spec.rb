require 'rails_helper'

RSpec.describe "Collections", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/collection/index"
      expect(response).to have_http_status(:success)
    end
  end

end
