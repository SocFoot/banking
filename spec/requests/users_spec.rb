require 'rails_helper'

RSpec.describe "Users", type: :request do
 RSpec.shared_context "user_owner_request", :user_logged_request do
    before(:each) do
      @user = create(:user)
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

  RSpec.shared_context "user_admin_request", :user_admin_request do
    before(:each) do
      @admin = create(:admin)
      @user = create(:user)
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
  
  RSpec.shared_context "user_not_logged_epargne", :user_not_logged_request do
    before(:each) do
      @user = create(:user)
    end
  end
  describe "log in/requests/log out", :user_logged_request do
    it "get users" do
      get users_path
      expect(assigns(:users)).to eq(User.all)
      expect(response.status).to eq(200)
    end
    
    it "get show @user" do
      get user_path(@user)
      expect(assigns(:user)).to eq(@user)
      expect(response.status).to eq(200)
    end
    
    it "get new @user" do
      get new_user_url
      expect(response).to redirect_to new_user_session_url
    end
    
    it "get edit @user" do
      get edit_user_path(@user)
      expect(assigns(:user)).to eq(@user)
      expect(response.status).to eq(200)
      put "/users/#{@user.id}", {id: @user.id, user:{prenom:"toto"}}
      expect(response).to redirect_to(@user)
    end
  end
  
  describe "admin_in/behavior/admin_out", :user_admin_request do
    it "get users" do
      get users_path
      expect(assigns(:users)).to eq(User.all)
      expect(response.status).to eq(200)
    end
    
    it "get show @user" do
      get user_path(@user)
      expect(assigns(:user)).to eq(@user)
      expect(response.status).to eq(200)
    end
    
    it "get new @user" do
      get new_user_url
      expect(assigns(:user)).to be_a_new(User)
      expect(response.status).to eq(200)
    end
    
    it "get edit @user" do
      get edit_user_path(@user)
      expect(assigns(:user)).to eq(@user)
      expect(response.status).to eq(200)
      put "/users/#{@user.id}", {id: @user.id, user:{prenom:"toto"}}
      expect(response).to redirect_to(assigns(:users))
    end
  end
  
  describe "not logged user", :user_not_logged_request do
    it "get users" do
      get users_path
      expect(assigns(:users)).to redirect_to new_user_session_url
    end

    it "get new @user" do
      valid_attributes = {user:{prenom:@user.prenom, nom:"arf", sexe:"femme", email:"toto@gmail.com", adresse:"1 rue", password: "password", password_confirmation: "password" }}
      get new_user_url
      expect(assigns(:user)).to be_a_new(User)
      post "/users", valid_attributes
      expect(response).to redirect_to root_url
    end
    
    it "get show @user" do
      get user_path(@user)
      expect(assigns(:user)).to redirect_to new_user_session_url
    end
    
    it "get edit @user" do
      @user = User.last
      get edit_user_path(@user)
      expect(assigns(:user)).to redirect_to new_user_session_url
    end
  end
end
