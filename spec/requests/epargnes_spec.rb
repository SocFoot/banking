require 'rails_helper'

RSpec.describe "Epargnes", type: :request do
  
  let(:valid_attributes){
    {epargne:{libelle:"libelle", rate:8.5,user_id: 1 }}
    }
  
  let(:new_attributes){
    {rate:2.3 }
  }
  
  RSpec.shared_context "epargne_owner_request", :epargne_owner_request do
    before(:each) do
      @user = create(:user)
      @epargne = @user.epargnes[0]
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


  RSpec.shared_context "epargne_not_owner_request", :epargne_not_owner_request do
    before(:each) do
      @user = create(:user)
      @epargne = create(:epargne)
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
  
  RSpec.shared_context "epargne_admin_request", :epargne_admin_request do
    before(:each) do
      @admin = create(:admin)
      @epargne = create(:epargne)
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
  
  RSpec.shared_context "epargne_not_logged_epargne", :epargne_not_logged_request do
    before(:each) do
      @epargne = create(:epargne)
    end
  end
  
  describe "log in/requests/log out", :epargne_owner_request do
    it "get epargnes" do
      get epargnes_path
      expect(assigns(:epargnes)).to eq(Epargne.tri(@user.id))
      expect(response.status).to eq(200)
    end
    
    it "get show @epargne" do
      get epargne_path(@epargne)
      expect(assigns(:epargne)).to eq(@epargne)
      expect(response.status).to eq(200)
    end
    
    it "get new @epargne" do
      get new_epargne_url
      expect(assigns(:epargne)).to be_a_new(Epargne)
      expect(response.status).to eq(200)
      post "/epargnes", valid_attributes
      expect(response).to redirect_to(Epargne.last)
    end
    
    it "get edit @epargne" do
      get edit_epargne_path(@epargne)
      expect(assigns(:epargne)).to eq(@epargne)
      expect(response.status).to eq(200)
      put "/epargnes/#{@epargne.id}", {id: @epargne.id, epargne: new_attributes }
      expect(response).to redirect_to(@epargne)
    end
  end
  
  describe "admin_in/behavior/admin_out", :epargne_admin_request do      
    it "get epargnes" do
      get epargnes_path
      expect(assigns(:epargnes)).to eq(Epargne.all)
      expect(response.status).to eq(200)
    end
    
    it "get show @epargne" do
      get epargne_path(@epargne)
      expect(assigns(:epargne)).to eq(@epargne)
      expect(response.status).to eq(200)
    end
    
    it "get new @epargne" do
      get new_epargne_url
      expect(assigns(:epargne)).to be_a_new(Epargne)
      expect(response.status).to eq(200)
      post "/epargnes", valid_attributes
      expect(response).to redirect_to(Epargne.last)
    end
    
    it "get edit @epargne" do
      get edit_epargne_path(@epargne)
      expect(assigns(:epargne)).to eq(@epargne)
      expect(response.status).to eq(200)
      put "/epargnes/#{@epargne.id}", {id: @epargne.id, epargne: new_attributes}
      expect(response).to redirect_to(assigns(:epargnes))
    end
  end
  
  describe "not owner", :epargne_not_owner_request do
    it "get show epargne" do
      get epargne_path(@epargne)  
      expect(response).to redirect_to root_url
    end
    
    it "get edit @epargne" do
      get edit_epargne_path(@epargne)
      expect(response).to redirect_to root_url
    end
  end
  
  context "not logged epargne", :epargne_not_logged_request do
    it "get epargnes" do
      get epargnes_path
      expect(response).to redirect_to new_user_session_url
    end

    it "get new epargne" do
      get new_epargne_url
      expect(response).to redirect_to new_user_session_url
    end
    
    it "get show epargne" do
      get epargne_path(@epargne)
      expect(response).to redirect_to new_user_session_url
    end
    
    it "get edit @epargne" do
      get edit_epargne_path(@epargne)
      expect(response).to redirect_to new_user_session_url
    end
  end
end
