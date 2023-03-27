require "rails_helper"

RSpec.describe AdsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ads").to route_to("ads#index")
    end

    it "routes to #new" do
      expect(get: "/ads/new").to route_to("ads#new")
    end

    it "routes to #show" do
      expect(get: "/ads/1").to route_to("ads#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/ads/1/edit").to route_to("ads#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/ads").to route_to("ads#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/ads/1").to route_to("ads#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/ads/1").to route_to("ads#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/ads/1").to route_to("ads#destroy", id: "1")
    end
  end
end
