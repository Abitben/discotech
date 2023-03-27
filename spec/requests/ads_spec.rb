require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/ads", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Ad. As you add validations to Ad, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Ad.create! valid_attributes
      get ads_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      ad = Ad.create! valid_attributes
      get ad_url(ad)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_ad_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      ad = Ad.create! valid_attributes
      get edit_ad_url(ad)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Ad" do
        expect {
          post ads_url, params: { ad: valid_attributes }
        }.to change(Ad, :count).by(1)
      end

      it "redirects to the created ad" do
        post ads_url, params: { ad: valid_attributes }
        expect(response).to redirect_to(ad_url(Ad.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Ad" do
        expect {
          post ads_url, params: { ad: invalid_attributes }
        }.to change(Ad, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post ads_url, params: { ad: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested ad" do
        ad = Ad.create! valid_attributes
        patch ad_url(ad), params: { ad: new_attributes }
        ad.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the ad" do
        ad = Ad.create! valid_attributes
        patch ad_url(ad), params: { ad: new_attributes }
        ad.reload
        expect(response).to redirect_to(ad_url(ad))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        ad = Ad.create! valid_attributes
        patch ad_url(ad), params: { ad: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested ad" do
      ad = Ad.create! valid_attributes
      expect {
        delete ad_url(ad)
      }.to change(Ad, :count).by(-1)
    end

    it "redirects to the ads list" do
      ad = Ad.create! valid_attributes
      delete ad_url(ad)
      expect(response).to redirect_to(ads_url)
    end
  end
end