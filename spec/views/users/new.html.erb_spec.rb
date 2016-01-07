require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :nom => "foo",
      :prenom => "MyString",
      :sexe => "MyString",
      :adresse => "MyString",
      :password => "3210",
      :password_confirmation => "3210"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_nom[name=?]", "user[nom]"

      assert_select "input#user_prenom[name=?]", "user[prenom]"

      assert_select "input#user_sexe[name=?]", "user[sexe]"

      assert_select "input#user_adresse[name=?]", "user[adresse]"

      assert_select "input#user_password[name=?]", "user[password]"
      
      assert_select "input#user_password_confirmation[name=?]", "user[password_confirmation]"
    end
  end
end
