require 'rails_helper'

RSpec.describe "Litiges", type: :request do
  describe "GET /litiges" do
    it "works! (now write some real specs)" do
      get litiges_path
      expect(response).to have_http_status(200)
    end
  end
end
