FactoryGirl.define do
  factory :litige do
    identifiant {Litige.idenfifiant_generator( 2, 3)[0..4]} 
    status "aie"
    motif "nil"
    trans
 
  end
end