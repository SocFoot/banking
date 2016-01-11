require 'rails_helper'

RSpec.describe "Litiges", type: :request do
  describe "GET /litiges" do
    it "works! (now write some real specs)" do
      @user = User.first
      get users_path
      expect(response).to have_http_status(200)
      post_via_redirect login_url, nom:@user.nom, prenom: @user.prenom, password: '3210'
      get litiges_path
      expect(response).to have_http_status(200)
    end
  end
end
