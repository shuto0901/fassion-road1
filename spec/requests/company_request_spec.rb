require 'rails_helper'

RSpec.describe "Companies", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/company/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/company/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/company/update"
      expect(response).to have_http_status(:success)
    end
  end

end
