require 'rails_helper'

RSpec.describe Account, type: :model do
  
  describe "bank account attributes" do
    it "should include the :title attribute" do
      expect(Account.new.attributes).to include("zip")
    end
    
    it "should include the :title attribute" do
      expect(Account.new.attributes).to include("libelle")
    end
  end
  
  describe "bood account" do
  it "create should pass" do
       Account.create!(
          :zip => "1111111111111111",
          :libelle => "e"    
        )
    end
  end
  describe "bad account" do
      it "second create should not pass" do
        Account.create!(
          :zip => "1111111111111111",
          :libelle => "e"    
        )
        @second = Account.new(
          :zip => "1111111111111111",
          :libelle => "e"    
        )
        @second.invalid?
      end
      it "second create should not pass" do
        @account = Account.new(
          :zip => "11111111111",
          :libelle => "e"    
        )
        @account.invalid?
      end
    end
end
