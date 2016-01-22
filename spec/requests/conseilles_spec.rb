require 'rails_helper'

RSpec.describe "Conseilles", type: :request do

  let(:valid_attributes){
    {conseille:{nom: "toto", prenom: "nil", user_id: 1, account_id: nil, transaction_id: nil, litige_id: nil}}
  }
  
  let(:new_attributes){
    { nom:"titi" }
  }

  RSpec.shared_context "conseille_owner_request", :conseille_owner_request do
    before(:each) do
      @user = create(:user)
      @conseille = @user.conseilles[0]
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


  RSpec.shared_context "conseille_not_owner_request", :conseille_not_owner_request do
    before(:each) do
      @user = create(:user)
      @conseille = create(:conseille)
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
  
  RSpec.shared_context "conseille_admin", :conseille_admin_request do
    before(:each) do
      @admin = create(:admin)
      @conseille = create(:conseille)
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
  
  RSpec.shared_context "conseille_not_logged", :conseille_not_logged_request do
    before(:each) do
      @conseille = create(:conseille)
    end
  end
  
  describe "log in/requests/log out", :conseille_owner_request do
    it "get conseilles" do
      get conseilles_path
      expect(assigns(:conseilles)).to eq(Conseille.all)
      expect(response.status).to eq(200)
    end
    
    it "get show @conseille" do
      get conseille_path(@conseille)
      expect(response.status).to redirect_to root_url
    end
    
    it "get new @conseille" do
      get new_conseille_url
      expect(response).to redirect_to root_url
    end

    it "get edit @conseille" do
      get edit_conseille_path(@conseille)
      expect(assigns(:conseille)).to eq(@conseille)
    end
  end

  describe "admin_in/behavior/admin_out", :conseille_admin_request do
    it "get conseilles" do
      get conseilles_path
      expect(assigns(:conseilles)).to eq(Conseille.all)
      expect(response.status).to eq(200)
    end

    it "get show @conseille" do
      get conseille_path(@conseille)
      expect(assigns(:conseille)).to eq(@conseille)
      expect(response.status).to eq(200)
    end
    
    it "get new @conseille" do  
      get new_conseille_url
      expect(assigns(:conseille)).to be_a_new(Conseille)
      expect(response.status).to eq(200)
      post "/conseilles", valid_attributes
      expect(response).to redirect_to conseille_path(Conseille.last)
    end
    
    it "get edit @conseille" do
      get edit_conseille_path(@conseille)
      expect(assigns(:conseille)).to eq(@conseille)
      expect(response.status).to eq(200)
      put "/conseilles/#{@conseille.id}", {id: @conseille.id, conseille: new_attributes}
      expect(response).to redirect_to(assigns(:conseilles))
    end
  end
  
  describe "not owner", :conseille_not_owner_request do
    it "get show conseille" do
      get conseille_path(@conseille)  
      expect(response).to redirect_to root_url
    end
    
    it "get edit @conseille" do
      get edit_conseille_path(@conseille)
      expect(response.status).to  eq(200)
    end
  end
  
  context "not logged conseille", :conseille_not_logged_request do
    it "get conseilles" do
      get conseilles_path
      expect(response).to redirect_to new_user_session_url
    end

    it "get new conseille" do
      get new_conseille_url
      expect(response).to redirect_to root_url
    end
    
    it "get show conseille" do
      get conseille_path(@conseille)
      expect(response).to redirect_to root_url
    end
    
    it "get edit @conseille" do
      @conseille = Conseille.last
      get edit_conseille_path(@conseille)
      expect(response).to redirect_to new_user_session_url
    end
  end
end
