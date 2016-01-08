require "rails_helper"

RSpec.describe EpargnesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/epargnes").to route_to("epargnes#index")
    end

    it "routes to #new" do
      expect(:get => "/epargnes/new").to route_to("epargnes#new")
    end

    it "routes to #show" do
      expect(:get => "/epargnes/1").to route_to("epargnes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/epargnes/1/edit").to route_to("epargnes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/epargnes").to route_to("epargnes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/epargnes/1").to route_to("epargnes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/epargnes/1").to route_to("epargnes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/epargnes/1").to route_to("epargnes#destroy", :id => "1")
    end

  end
end
