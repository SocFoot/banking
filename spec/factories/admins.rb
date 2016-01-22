FactoryGirl.define do
  factory :admin do
    sequence :nom do |n|
       "admin"+"#{n}"
    end
    sequence :prenom do |n|
      "nzakou" + "#{n}"
    end    
    sequence :email do |n|
      "#{n}admin@gmail.com"
    end
    password "password"
    password_confirmation "password"
    after(:create) do |admin|
      create(:account, admin: admin)
    end
  end
end