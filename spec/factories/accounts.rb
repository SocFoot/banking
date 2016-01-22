FactoryGirl.define do
  factory :account do
    sequence( :zip, (2..9).cycle ) do |n|
      "#{n}123123123123123"
    end
    libelle "nil"

    user
    after(:create) do |account|
      create(:transaction, account: account)
      create(:conseille, account: account)
    end
  end 
end