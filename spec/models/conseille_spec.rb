require 'rails_helper'

RSpec.describe Conseille, type: :model do
  describe "Conseille attributes" do
    it "should include the :nom attribute" do
      expect(Conseille.new.attributes).to include("nom")
    end
    
    it "should include the :repnom attribute" do
      expect(Conseille.new.attributes).to include("prenom")
    end
  end
  
  describe "good conseille" do
    it "create should pass" do
      Conseille.create!(
        :nom => "MyString",
        :prenom => "2"""
      )
    end
  end
  
  describe "bad conseille" do    
    it "no nom create should not pass" do
      Conseille.new(
        :prenom => "2"
      ).invalid?
    end
    
    it "no prenom create should not pass" do
      Conseille.new(
        :nom => "2"
      ).invalid?
    end
  end
end
