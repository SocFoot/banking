FactoryGirl.define do
  factory :litige do
    sequence( :identifiant, (2..9).cycle ) do |n|
     "EQ15" + "#{n}"
    end  
    status "aie"
    motif "nil"
    trans
  end
end