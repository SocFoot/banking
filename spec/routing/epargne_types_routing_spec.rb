require "rails_helper"

RSpec.describe EpargneTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/epargne_types").to route_to("epargne_types#index")
    end

    it "routes to #new" do
      expect(:get => "/epargne_types/new").to route_to("epargne_types#new")
    end

    it "routes to #show" do
      expect(:get => "/epargne_types/1").to route_to("epargne_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/epargne_types/1/edit").to route_to("epargne_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/epargne_types").to route_to("epargne_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/epargne_types/1").to route_to("epargne_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/epargne_types/1").to route_to("epargne_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/epargne_types/1").to route_to("epargne_types#destroy", :id => "1")
    end

  end
end
