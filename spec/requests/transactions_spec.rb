require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  let(:valid_session) { { user_id: User.first.id } }

  describe "GET /transactions" do
    
    it "works! (now write some real specs)" do 
      @user = User.first
      get users_path
      expect(response).to have_http_status(200)
      post_via_redirect login_url, nom:@user.nom, prenom: @user.prenom, password: '3210'
      expect(response).to have_http_status(200)
      get transactions_path
      expect(response).to have_http_status(200)
    end
  end
end
