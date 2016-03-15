FactoryGirl.define do
  factory :user do
    sequence :nom do |n|
       "foo"+"#{n}"
    end
    sequence :prenom do |n|
      "bar" + "#{n}"
    end
    sexe "h"
    adresse "7 rue"
    sequence :email do |n|
      "#{n}@gmail.com"
    end
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
    after(:create) do |user|
      account = create(:account, user: user)
      transaction = create(:transaction, account: account)
      create(:litige, trans: transaction)
      create(:conseille, users: [user])
      create(:epargne, user: user)
    end
  end
end