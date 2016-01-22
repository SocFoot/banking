require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  
  let(:valid_attributes){
    {transaction:{libelle:"libelle", in:12, account_id: 1 }}
    }
  
  let(:new_attributes){
    { in:45 }
  }

  RSpec.shared_context "transaction_owner_request", :transaction_owner_request do
    before(:each) do
      @user = create(:user)
      @transaction = @user.accounts[0].transactions[0]
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


  RSpec.shared_context "transaction_not_owner_request", :transaction_not_owner_request do
    before(:each) do
      @user = create(:user)
      @transaction = create(:transaction)
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
  
  RSpec.shared_context "transaction_admin_request", :transaction_admin_request do
    before(:each) do
      @admin = create(:admin)
      @transaction = create(:transaction)
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
  
  RSpec.shared_context "transaction_not_logged_request", :transaction_not_logged_request do
    before(:each) do
      @transaction = create(:transaction)
    end
  end

  describe "log in/requests/log out", :transaction_owner_request do
    it "get transactions" do
      get transactions_path
      expect(assigns(:transactions)).to eq(Transaction.tri(@user.id))
      expect(response.status).to eq(200)
    end
    
    it "get show @transaction" do
      get transaction_path(@transaction)
      expect(assigns(:transaction)).to eq(@transaction)
      expect(response.status).to eq(200)
    end
    
    it "get new @transaction" do
      get new_transaction_url
      expect(response).to redirect_to root_url
    end
    
    it "get edit @transaction" do
      get edit_transaction_path(@transaction)
      expect(assigns(:transaction)).to redirect_to root_url
    end
  end
  
  describe "admin_in/behavior/admin_out", :transaction_admin_request do     
    it "get transactions" do
      get transactions_path
      expect(assigns(:transactions)).to eq(Transaction.all)
      expect(response.status).to eq(200)
    end
    
    it "get show @transaction" do
      get transaction_path(@transaction)
      expect(assigns(:transaction)).to eq(@transaction)
      expect(response.status).to eq(200)
    end
    
    it "get new @transaction" do
      get new_transaction_url
      expect(assigns(:transaction)).to be_a_new(Transaction)
      expect(response.status).to eq(200)
      post "/transactions", valid_attributes
      expect(response).to redirect_to(Transaction.last)
    end
    
    it "get edit @transaction" do
      get edit_transaction_path(@transaction)
      expect(assigns(:transaction)).to eq(@transaction)
      expect(response.status).to eq(200)
      put "/transactions/#{@transaction.id}", {id: @transaction.id, transaction: new_attributes}
      expect(response).to redirect_to(assigns(:transactions))
    end
  end
  
  describe "not owner", :transaction_not_owner_request do
    it "get show transaction" do
      get transaction_path(@transaction)  
      expect(response).to redirect_to root_url
    end
    
    it "get edit @transaction" do
      get edit_transaction_path(@transaction)
      expect(response).to redirect_to root_url
    end
  end
  
  context "not logged transaction", :transaction_not_logged_request do
    it "get transactions" do
      get transactions_path
      expect(response).to redirect_to new_user_session_url 
    end

    it "get new transaction" do
      get new_transaction_url
      expect(response).to redirect_to root_url 
    end
    
    it "get show transaction" do
      get transaction_path(@transaction)
      expect(response).to redirect_to new_user_session_url 
    end
    
    it "get edit @epargne" do
      get transaction_path(@transaction)
      expect(response).to redirect_to new_user_session_url 
    end
  end
end
