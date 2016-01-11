require 'rails_helper'

RSpec.describe "UserFlows", type: :request do
  describe "new user" do
    it "works! " do
      get new_user_url, {}
      expect(response).to redirect_to root_url
      post_via_redirect users_url , user:{name:"foo", prenom:"bar", adresse:"7 rue", sexe:"femme", password: '3210'}
      assert_response :success
    end
  end
  
  describe "login" do
    fixtures :users  
      
    it "works! " do
      foo = users(:one)

      post_via_redirect "/login" , nom: foo.nom, prenom:foo.prenom, password: '3210'
      assert_response :success
      delete_via_redirect "/logout", {}, {"HTTPS" => "on", 'HTTP_REFERER' => root_url}
      assert_response :success
    end
  end
  
end
