require 'rails_helper'

RSpec.describe EpargneType, type: :model do
    describe "Epargne attributes" do
    it "should include the :nom attribute" do
      expect(EpargneType.new.attributes).to include("nom")
    end
    
    it "should include the :epargne_id attribute" do
      expect(EpargneType.new.attributes).to include("epargne_id")
    end
  end
  
  describe "good epargne_type" do
    it "create should pass" do
      EpargneType.create!(
        :nom => "MyString",
        :epargne_id => 2
      )
    end
  end
  
  
  describe "bad account" do    
    
    it "same nom don't pass" do
      EpargneType.create!(
        :nom => "MyString",
        :epargne_id => 2
      )
      EpargneType.new(
        :nom => "MyString",
        :epargne_id => 2
      ).invalid?
    end
    
    it "no nom create should not pass" do
      EpargneType.new(
        :epargne_id => 2
      ).invalid?
    end
  end
end
