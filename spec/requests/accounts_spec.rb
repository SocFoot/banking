require 'rails_helper'

RSpec.describe "Accounts", type: :request do
  
  let(:valid_attributes){
    {account:{libelle:"libelle", zip:4111111111111112, user_id: 1 }}
    }
  
  let(:new_attributes){
    {libelle: "toto"}
  }
  
  RSpec.shared_context "account_owner_request", :account_owner_request do
    before(:each) do
      @user = create(:user)
      @account = @user.accounts[0]
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


  RSpec.shared_context "account_not_owner_request", :account_not_owner_request do
    before(:each) do
      @user = create(:user)
      @account = create(:account)
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
  
  RSpec.shared_context "account_admin", :account_admin_request do
    before(:each) do
      @admin = create(:admin)
      @account = create(:account)
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
  
  RSpec.shared_context "account_not_logged", :account_not_logged_request do
    before(:each) do
      @account = create(:account)
    end
  end

  describe "log in/requests/log out", :account_owner_request do

    it "get accounts" do
      get accounts_path
      expect(assigns(:accounts)).to eq(Account.tri(@user.id))
      expect(response.status).to eq(200)
    end
    
    it "get show @Account" do
      get account_path(@account)
      expect(assigns(:account)).to eq(@account)
      expect(response.status).to eq(200)
    end
    
    it "get new @account" do
      get new_account_url
      expect(assigns(:account)).to be_a_new(Account)
      expect(response.status).to eq(200)
      post "/accounts", valid_attributes
      expect(response).to redirect_to(Account.last)
    end
    
    it "get edit @account" do
      get edit_account_path(@account)
      expect(assigns(:account)).to eq(@account)
      expect(response.status).to eq(200)
      put "/accounts/#{@account.id}", {id: @account.id, account: new_attributes }
      expect(response).to redirect_to(@account)
    end
  end
  
  describe "admin_in/behavior/admin_out", :account_admin_request do        
    it "get accounts" do
      get accounts_path
      expect(assigns(:accounts)).to eq(Account.all)
      expect(response.status).to eq(200)
    end
    
    it "get show @account" do
      get account_path(@account)
      expect(assigns(:account)).to eq(@account)
      expect(response.status).to eq(200)
    end
    
    it "get new @account" do
      get new_account_url
      expect(assigns(:account)).to be_a_new(Account)
      expect(response.status).to eq(200)
      post "/accounts", valid_attributes
      expect(response).to redirect_to(Account.last)
    end
    
    it "get edit @account" do
      get edit_account_path(@account)
      expect(assigns(:account)).to eq(@account)
      expect(response.status).to eq(200)
      put "/accounts/#{@account.id}", {id: @account.id, account: new_attributes}
      expect(response).to redirect_to(assigns(:accounts))
    end
  end
  
  describe "not owner", :account_not_owner_request do
    it "get show account" do
      get account_path(@account)  
      expect(response).to redirect_to root_url
    end
    
    it "get edit @account" do
      get edit_account_path(@account)
      expect(response).to redirect_to root_url
    end
  end
  
  context "not logged account", :account_not_logged_request do
    it "get accounts" do
      get accounts_path
      expect(response).to redirect_to new_user_session_url
    end

    it "get new account" do
      get new_account_url
      expect(response).to redirect_to new_user_session_url
    end
    
    it "get show account" do
      get account_path(@account)
      expect(response).to redirect_to new_user_session_url
    end
    
    it "get edit @account" do
      get edit_account_path(@account)
      expect(response).to redirect_to new_user_session_url
    end
  end
end
