require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  before(:each) do
    User.create!(
        :nom => "foo",
        :prenom => "Prenom",
        :sexe => "Sexe",
        :adresse => "Adresse",
        :password_digest => "Password Digest"      
      )
    User.create!(
        :nom => "boo",
        :prenom => "Prenom",
        :sexe => "Sexe",
        :adresse => "Adresse",
        :password_digest => "Password Digest"      
      )
  end
  describe "GET #show" do
    it "returns http success" do
      @request.session["user_id"] = User.first.id
      get :show
      expect(response).to have_http_status(:success)
    end
    
    it "returns http error" do
      @request.session["user_id"] = User.second.id
      get :show
      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to be_present
    end
  end

end
