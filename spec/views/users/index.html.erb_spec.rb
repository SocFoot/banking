require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :nom => "foo",
        :prenom => "Prenom",
        :sexe => "Sexe",
        :adresse => "Adresse",
        :password_digest => "Password Digest"
      ),
      User.create!(
        :nom => "bar",
        :prenom => "Prenom",
        :sexe => "Sexe",
        :adresse => "Adresse",
        :password_digest => "Password Digest"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "foo".to_s, :count => 1
    assert_select "tr>td", :text => "bar".to_s, :count => 1
    assert_select "tr>td", :text => "Prenom".to_s, :count => 2
    assert_select "tr>td", :text => "Sexe".to_s, :count => 2
    assert_select "tr>td", :text => "Adresse".to_s, :count => 2
  end
end
