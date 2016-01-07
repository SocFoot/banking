require 'rails_helper'

RSpec.describe User, type: :model do
  
    it "create should pass" do
      User.create!(
        :nom => "foo",
        :prenom => "Prenom",
        :sexe => "Sexe",
        :adresse => "Adresse",
        :password_digest => "Password Digest"      
      )
    end
  
    it "second create should not pass" do
      User.create!(
        :nom => "foo",
        :prenom => "Prenom",
        :sexe => "Sexe",
        :adresse => "Adresse",
        :password_digest => "Password Digest"      
      )

      @second = User.new(
        :nom => "foo",
        :prenom => "Prenom",
        :sexe => "Sexe",
        :adresse => "Adresse",
        :password_digest => "Password Digest"      
      )
      @second.invalid?
    end
end
