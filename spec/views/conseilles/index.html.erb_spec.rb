require 'rails_helper'

RSpec.describe "conseilles/index", type: :view do
  before(:each) do
    assign(:conseilles, [
      Conseille.create!(
        :nom => "Nom",
        :prenom => "Prenom"
      ),
      Conseille.create!(
        :nom => "Nom",
        :prenom => "Prenom"
      )
    ])
  end

  it "renders a list of conseilles" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Prenom".to_s, :count => 2
  end
end
