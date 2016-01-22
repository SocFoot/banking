RSpec.shared_context "shared stuff", :owner do
  before(:each) do
    @user = create(:user)
    @account = @user.accounts[0]
    @account_id = @account.id
    @epargne = @user.epargnes[0]

    @transaction = @account.transactions[0]
    @transaction_id = @transaction.id
    @id = @user.id.to_s
    sign_in @user  
  end
end

RSpec.shared_context "admin def", :admin do
  before(:each) do
    
    @admin = create(:admin)     
    @transaction = create(:transaction)
    @conseille = create(:conseille) 
    @epargne = create(:epargne)
    @account = @transaction.account
    @account_id = @account.id
   
    @transaction_id = @transaction.id
    @id = @admin.id.to_s
    sign_in @admin
  end
end

RSpec.shared_context "not_owner", :not_owner do
  include Devise::TestHelpers
  before(:each) do
    @user = create(:user)
    @account = @user.accounts[0]
    @account_id = @account.id
    @epargne = @user.epargnes[0]

    @transaction = @account.transactions[0]
    @transaction_id = @transaction.id
    @epargne = create(:epargne)
    @id = @user.id.to_s
    sign_in create(:user)  
  end
end
module ControllersHelpers
  
  def owner
    include Devise::TestHelpers
      fixtures :accounts
      fixtures :transactions
      fixtures :litiges
      fixtures :conseilles

  end
  
  def admin
    include Devise::TestHelpers

    before(:each) do
      @admin = create(:admin)
      
      @user = User.first
      @account = Account.first
      @transaction = Transaction.first
      sign_in @admin

    end
  end
  
  def not_owner
    include Devise::TestHelpers
    fixtures :users
    fixtures :accounts
    fixtures :transactions
    fixtures :litiges
    fixtures :conseilles
    before(:each) do
      @user = User.second
      @account = Account.third
      @epargne = Epargne.third
      @transaction = Transaction.third
      sign_in @user  
    end
  end
end