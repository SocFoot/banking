require 'rails_helper'

RSpec.describe User, type: :model do
    describe "Users attributes" do
      it "should include the :prenom attribute" do
        expect(User.new.attributes).to include("prenom")
      end
  
      it "should include the :nom attribute" do
        expect(User.new.attributes).to include("nom")
      end
      
      it "should include the :sexe attribute" do
        expect(User.new.attributes).to include("sexe")
      end
      
      it "should include the :adresse attribute" do
        expect(User.new.attributes).to include("adresse")
      end
    end
    
    describe "good users" do
      it "create should pass" do
        User.new(
          prenom: "toto",
          nom: "tata",
          sexe: "h",
          adresse: " 7 s",
          email: "az@g.com",
          password: " 2154sdfsdfd"
        ).invalid?
      end
    end
    
    describe "bad users" do
      it "create should not pass no prenom" do
        User.new(
          nom: "tata",
          sexe: "h",
          adresse: " 7 s",
          email: "saz@g.com",
          password: " 2154sdfsdfd"          
        ).invalid?
      end
      
      it "create should not pass no nom" do
        User.new(
          prenom:"er",
          sexe: "h",
          adresse: " 7 s",
          email: "saz@g.com",
          password: " 2154sdfsdfd"          
        ).invalid?
      end
      
      it "create should not pass no sexe" do
        User.new(
          nom:"ee",
          prenom:"er",
          adresse: " 7 s",
          email: "saz@g.com",
          password: " 2154sdfsdfd"          
        ).invalid?
      end
      
      it "create should not pass no adresse" do
        User.new(
          prenom:"er",
          nom: "tata",
          sexe: "h",
          email: "saz@g.com",
          password: " 2154sdfsdfd"          
        ).invalid?
      end
      
      it "create should not pass no email" do
        User.new(
          prenom:"er",
          nom: "tata",
          sexe: "h",
          adresse: " 7 s",
          password: " 2154sdfsdfd"          
        ).invalid?
      end
      
      it "create should not pass no pass" do
        User.new(
          prenom:"er",
          nom: "tata",
          sexe: "h",
          adresse: " 7 s",
          email: "saz@g.com"     
        ).invalid?
      end
      
       it "second create should not pass" do
        User.create!(
          :nom => "fsoo",
          :prenom => "Preom",
          :sexe => "Sexe",
          :adresse => "Adresse",
          :password => "Password Digest",
          :email => "zertzert@gmail.com",
          :password => "zezezeze"   
        )
  
        @second = User.new(
          :nom => "foo",
          :prenom => "Prenom",
          :sexe => "Sexe",
          :adresse => "Adressse",
          :password => "Passwor",
          :email => "zertzert@gmail.com" ,
          :password => "zezezeze"           
        )
        @second.invalid?
      end
    end    
end
