require 'rails_helper'

RSpec.describe "Epargnes", type: :request do
  describe "GET /epargnes" do
    it "works! (now write some real specs)" do
      get epargnes_path
      expect(response).to have_http_status(200)
    end
  end
end
