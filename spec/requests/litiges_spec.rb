require 'rails_helper'

RSpec.describe "Litiges", type: :request do

  
  let(:valid_attributes){
    {litige:{identifiant: Litige.idenfifiant_generator(2,3), status: "traité", motif: "lol", transaction_id:nil}}
  }
  
  let(:new_attributes){
    { status:"toto" }
  }
  
  RSpec.shared_context "litige_owner_request", :litige_owner_request do
    before(:each) do
      @user = create(:user)
      @litige = @user.accounts[0].transactions[0].litiges[0]
      @user.update(confirmed_at: Time.zone.now)
      get new_user_session_url
      expect(response.status).to eq(200)
      post  user_session_path, 'user' => {'email' => @user.email, 'password' => @user.password}
      get users_url
      expect(response.status).to eq(200) 
    end
    
    after(:each) do
          delete destroy_user_session_url
      expect(response).to redirect_to root_url
    end
  end


  RSpec.shared_context "litige_not_owner_request", :litige_not_owner_request do
    before(:each) do
      @user = create(:user)
      @litige = create(:litige)
      get new_user_session_url
      expect(response.status).to eq(200)
      post  user_session_path, 'user' => {'email' => @user.email, 'password' => @user.password}
      get users_url
      expect(response.status).to eq(200) 
    end
    
    after(:each) do
          delete destroy_user_session_url
      expect(response).to redirect_to root_url
    end
  end
  
  RSpec.shared_context "litige_admin", :litige_admin_request do
    before(:each) do
      @admin = create(:admin)
      @litige = create(:litige)
      get new_admin_session_url
      expect(response.status).to eq(200)
      post  admin_session_path, 'admin' => {'email' => @admin.email, 'password' => @admin.password}
      get users_url
      expect(response.status).to eq(200) 
    end
    
    after(:each) do
          delete destroy_admin_session_url
      expect(response).to redirect_to root_url
    end
  end
  
  RSpec.shared_context "litige_not_logged", :litige_not_logged_request do
    before(:each) do
      @litige = create(:litige)
    end
  end
  
  describe "log in/requests/log out", :litige_owner_request do
    it "get litiges" do
      get litiges_path
      expect(assigns(:litiges)).to eq(Litige.tri(@user.id))
      expect(response.status).to eq(200)
    end
    
    it "get show @litige" do
      get litige_path(@litige)
      expect(assigns(:litige)).to eq(@litige)
      expect(response.status).to eq(200)
    end
    
    it "get new @litige" do
      get new_litige_url
      expect(response.status).to eq(200)
    end
    
    it "get edit @litige" do
      get edit_litige_path(@litige)
      expect(response.status).to eq(200)
    end
  end
  
  describe "admin_in/behavior/admin_out", :litige_admin_request do     
    it "get litiges" do
      get litiges_path
      expect(assigns(:litiges)).to eq(Litige.all)
      expect(response.status).to eq(200)
    end
    
    it "get show @litige" do
      get litige_path(@litige)
      expect(assigns(:litige)).to eq(@litige)
      expect(response.status).to eq(200)
    end
    
    it "get new @litige" do  
      get new_litige_url
      expect(assigns(:litige)).to be_a_new(Litige)
      expect(response.status).to eq(200)
      post "/litiges", valid_attributes
      expect(response).to redirect_to litige_path(Litige.last)
    end
    
    it "get edit @litige" do
      get edit_litige_path(@litige)
      expect(assigns(:litige)).to eq(@litige)
      expect(response.status).to eq(200)
      put "/litiges/#{@litige.id}", {id: @litige.id, litige: new_attributes}
      expect(response).to redirect_to(assigns(:litiges))
    end
  end
  
  describe "not owner", :litige_not_owner_request do
    it "get show litige" do
      get litige_path(@litige)  
      expect(response).to redirect_to root_url
    end
    
    it "get edit @litige" do
      get edit_litige_path(@litige)
      expect(response).to redirect_to root_url
    end
  end
  
  context "not logged litige", :litige_not_logged_request do
    it "get litiges" do
      get litiges_path
      expect(response).to redirect_to new_user_session_url
    end

    it "get new litige" do
      get new_litige_url
      expect(response).to redirect_to new_user_session_url
    end
    
    it "get show litige" do
      get litige_path(@litige)
      expect(response).to redirect_to new_user_session_url
    end
    
    it "get edit @litige" do
      get litige_path(@litige)
      expect(response).to redirect_to new_user_session_url
    end
  end
end
