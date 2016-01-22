FactoryGirl.define do
  factory :transaction, aliases:[:trans] do
    sequence( :zip, (2..9).cycle ) do |n|
      "#{n}123123123123123"
    end
    out 9
    libelle nil
    account
    trait :trans do
      transaction
    end
    after(:create) do |transaction|
      create(:litige, trans: transaction)
    end
  end 
end