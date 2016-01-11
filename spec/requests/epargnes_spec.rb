require 'rails_helper'

RSpec.describe "Epargnes", type: :request do
  describe "GET /epargnes" do
    fixtures :users      
    it "works! (now write some real specs)" do

      get epargnes_path, {}, {user_id:User.first.id}
      expect(response).to redirect_to root_url
    end
  end
end
