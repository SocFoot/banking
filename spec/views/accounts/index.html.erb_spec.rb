require 'rails_helper'

RSpec.describe "accounts/index", type: :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        :zip => 1111111111111111,
        :libelle => "Libelle"
      ),
      Account.create!(
        :zip => 1111111111111221,
        :libelle => "Libelle"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => 1111111111111111.to_s, :count => 1
    assert_select "tr>td", :text => 1111111111111221.to_s, :count => 1
    assert_select "tr>td", :text => "Libelle".to_s, :count => 2
  end
end
