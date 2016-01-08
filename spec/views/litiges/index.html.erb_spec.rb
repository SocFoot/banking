require 'rails_helper'

RSpec.describe "litiges/index", type: :view do
  before(:each) do
    assign(:litiges, [
      Litige.create!(
        :identifiant => "ER012",
        :status => "Status",
        :motif => "Motif",
        :transaction_id => nil
      ),
      Litige.create!(
        :identifiant => "ER015",
        :status => "Status",
        :motif => "Motif",
        :transaction_id => nil
      )
    ])
  end

  it "renders a list of litiges" do
    render
    assert_select "tr>td", :text => "ER012".to_s, :count => 1
    assert_select "tr>td", :text => "ER015".to_s, :count => 1
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Motif".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
