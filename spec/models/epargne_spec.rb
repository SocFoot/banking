require 'rails_helper'

RSpec.describe Epargne, type: :model do
  describe "Epargne attributes" do
    it "should include the :libelle attribute" do
      expect(Epargne.new.attributes).to include("libelle")
    end
    
    it "should include the :user_id attribute" do
      expect(Epargne.new.attributes).to include("user_id")
    end
    
    it "should include the :rate attribute" do
      expect(Epargne.new.attributes).to include("rate")
    end
    
    it "should include the :receive attribute" do
      expect(Epargne.new.attributes).to include("receive")
    end
  end
  
  describe "good epargne" do
    it "create should pass" do
      Epargne.create!(
        :libelle => "MyString",
        :rate => "9.99",
        :user_id => 1
      )
    end
  end
  
  describe "bad account" do
    it "no user_id create should not pass" do
      Epargne.new(
        :libelle => "MyString",
        :rate => "9.99"
      ).invalid?
    end
    
    it "no rate create should not pass" do
      Epargne.new(
        :libelle => "MyString",
        :user_id => 5
      ).invalid?
    end
  end
end
