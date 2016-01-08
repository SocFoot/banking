require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "Transaction attributes" do
    it "should include the :in attribute" do
      expect(Transaction.new.attributes).to include("in")
    end

    it "should include the :out attribute" do
      expect(Transaction.new.attributes).to include("out")
    end
    
    it "should include the :libelle attribute" do
      expect(Transaction.new.attributes).to include("libelle")
    end
    
    it "should include the :account_id attribute" do
      expect(Transaction.new.attributes).to include("account_id")
    end
  end
  
  describe "good transaction" do
    it "create should pass" do
      Transaction.create!(
        out: 45,
        libelle: "er",
        account_id:1  
        )
    end
  end
  
  describe "bad account" do
    it "second create should not pass" do
      @transaction = Account.new(
        :libelle => "e"    
      )
      @transaction.invalid?
    end
  end
end
