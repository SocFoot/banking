require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = create(:user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_nom[name=?]", "user[nom]"

      assert_select "input#user_prenom[name=?]", "user[prenom]"

      assert_select "input#user_sexe[name=?]", "user[sexe]"

      assert_select "input#user_adresse[name=?]", "user[adresse]"

      assert_select "input#user_password[name=?]", "user[password]"
      
      assert_select "input#user_password_confirmation[name=?]", "user[password_confirmation]"
    end
  end
end
