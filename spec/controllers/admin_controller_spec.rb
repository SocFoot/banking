require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  
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