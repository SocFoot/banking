require "rails_helper"

RSpec.describe LitigesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/litiges").to route_to("litiges#index")
    end

    it "routes to #new" do
      expect(:get => "/litiges/new").to route_to("litiges#new")
    end

    it "routes to #show" do
      expect(:get => "/litiges/1").to route_to("litiges#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/litiges/1/edit").to route_to("litiges#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/litiges").to route_to("litiges#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/litiges/1").to route_to("litiges#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/litiges/1").to route_to("litiges#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/litiges/1").to route_to("litiges#destroy", :id => "1")
    end

  end
end
