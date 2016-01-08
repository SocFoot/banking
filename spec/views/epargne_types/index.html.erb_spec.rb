require 'rails_helper'

RSpec.describe "epargne_types/index", type: :view do
  before(:each) do
    assign(:epargne_types, [
      EpargneType.create!(
        :nom => "Nom",
        :epargne_id => 5
      ),
      EpargneType.create!(
        :nom => "No",
        :epargne_id => 5
      )
    ])
  end

  it "renders a list of epargne_types" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 1
    assert_select "tr>td", :text => "No".to_s, :count => 1
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
