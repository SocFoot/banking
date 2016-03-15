require 'rails_helper'

RSpec.describe "conseilles/show", type: :view do
  before(:each) do
    @conseille = assign(:conseille, Conseille.create!(
      :nom => "Nom",
      :prenom => "Prenom"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/Prenom/)
  end
end
