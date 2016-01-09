require 'rails_helper'

RSpec.describe "epargnes/index", type: :view do
  before(:each) do
    @user = User.create!(
          :nom => "foo",
          :prenom => "Prenom",
          :sexe => "Sexe",
          :adresse => "Adresse",
          :password_digest => "Password Digest"      
        )
    assign(:epargnes, [
      Epargne.create!(
        :libelle => "Libelle",
        :rate => "9.99",
        :user_id => @user.id
      ),
      Epargne.create!(
        :libelle => "Libelle",
        :rate => "9.99",
        :user_id => @user.id
      )
    ])
  end

  it "renders a list of epargnes" do
    render
    assert_select "tr>td", :text => "Libelle".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => @user.nom, :count => 2
  end
end
