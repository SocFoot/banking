require 'rails_helper'

RSpec.describe Litige, type: :model do
  describe "litige attributes" do
    it "should include the :transaction_id attribute" do
      expect(Litige.new.attributes).to include("transaction_id")
    end
    
    it "should include the :identifiant" do
      expect(Litige.new.attributes).to include("identifiant")
    end
    
    it "should include the :status attribute" do
      expect(Litige.new.attributes).to include("status")
    end
    
    it "should include the :motif attribute" do
      expect(Litige.new.attributes).to include("motif")
    end
  end
  
  describe "good litige" do
    it "create should pass" do
       Litige.create!(
          :identifiant => "ER123",
          :status => "coin",
          :motif => "blah"    
        )
    end
  end
  
  describe "bad litige" do
    it "second create should not pass" do
      Litige.create!(
          :identifiant => "ER123",
          :status => "coin",
          :motif => "blah"    
      )
      @second = Litige.new(
          :identifiant => "ER123",
          :status => "coin",
          :motif => "blah"    
       )
      @second.invalid?
    end
    
    it "no status create should not pass" do
      @litige = Litige.new(
        :identifiant => "ER123",
        :motif => "blah"        
      )
      @litige.invalid?
    end
    
    it "no motif create should not pass" do
      @litige = Litige.new(
        :identifiant => "ER123",
        :status => "coin"        
      )
      @litige.invalid?
    end
    
    it "bad identifiant create should not pass" do
      @litige = Litige.new(
        :identifiant => "ERb23",
        :status => "coin"        
      )
      @litige.invalid?
    end
    
    it "bad ident num size create should not pass" do
      @litige = Litige.new(
        :identifiant => "ER23",
        :status => "coin"        
      )
      @litige.invalid?
    end
    
    it "bad ident string size create should not pass" do
      @litige = Litige.new(
        :identifiant => "A123",
        :status => "coin"        
      )
      @litige.invalid?
    end
  end
  describe "test du litige" do
    it "nouveau ins change nada" do
      @account = Account.create!(
        :zip => "1911111111111111",
        :libelle => "e"    
      )
      @transaction = Transaction.create!(
        out: 45,
        libelle: "er",
        account_id:@account.id      
      )
      @total = Transaction.out(@account.id)
      @litige = Litige.create!(
        :identifiant => "EA123",
        :status => "Nouveau",
        :motif => "blah",
        :transaction_id => @transaction.id        
      )
      assert_equal @total, Transaction.ins(@account.id)
    end
    
    it "traité ins change nada" do
      @account = Account.create!(
        :zip => "1111111111111171",
        :libelle => "e"    
      )
      @transaction = Transaction.create!(
        out: 45,
        libelle: "er",
        account_id:@account.id      
      )
      @total = Transaction.out(@account.id)
      @litige = Litige.create!(
        :identifiant => "EA123",
        :status => "traité",
        :motif => "blah",
        :transaction_id => @transaction.id        
      )
      expect(Transaction.out(@account.id)).not_to eq @total
    end
  end
end
