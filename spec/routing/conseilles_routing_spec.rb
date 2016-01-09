require "rails_helper"

RSpec.describe ConseillesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/conseilles").to route_to("conseilles#index")
    end

    it "routes to #new" do
      expect(:get => "/conseilles/new").to route_to("conseilles#new")
    end

    it "routes to #show" do
      expect(:get => "/conseilles/1").to route_to("conseilles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/conseilles/1/edit").to route_to("conseilles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/conseilles").to route_to("conseilles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/conseilles/1").to route_to("conseilles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/conseilles/1").to route_to("conseilles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/conseilles/1").to route_to("conseilles#destroy", :id => "1")
    end

  end
end
