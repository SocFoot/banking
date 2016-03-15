FactoryGirl.define do
  factory :account do
    sequence :zip, (2..7).cycle do |n|
      n.to_s + [0,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6].shuffle[0..14].join("").to_s
    end
    libelle "nl"
    user

  end
end