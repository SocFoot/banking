require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :nom => "foo",
      :prenom => "Prenom",
      :sexe => "Sexe",
      :adresse => "Adresse",
      :password => "3210",
      :password_confirmation => "3210"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/Prenom/)
    expect(rendered).to match(/Sexe/)
    expect(rendered).to match(/Adresse/)
  end
end
