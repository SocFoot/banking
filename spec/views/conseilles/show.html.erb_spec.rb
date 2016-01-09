require 'rails_helper'

RSpec.describe "conseilles/show", type: :view do
  before(:each) do
    @conseille = assign(:conseille, Conseille.create!(
      :nom => "Nom",
      :prenom => "Prenom",
      :user_id => nil,
      :account_id => nil,
      :trans => nil,
      :litige_id => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/Prenom/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
