require 'rails_helper'

RSpec.describe "epargne_types/index", type: :view do
  before(:each) do
    @epargne = Epargne.create!(
      :libelle => "MyString",
      :rate => "9.99",
      :user_id => 5
    )
    assign(:epargne_types, [
      EpargneType.create!(
        :nom => "Nom",
        :epargne => @epargne
      ),
      EpargneType.create!(
        :nom => "No",
        :epargne => @epargne
      )
    ])
  end

  it "renders a list of epargne_types" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 1
    assert_select "tr>td", :text => "No".to_s, :count => 1
    assert_select "tr>td", :text => @epargne.libelle.to_s, :count => 2
  end
end
