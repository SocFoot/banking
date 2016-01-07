require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        :in => 1,
        :out => 2,
        :libelle => "Libelle",
        :account => nil
      ),
      Transaction.create!(
        :in => 1,
        :out => 2,
        :libelle => "Libelle",
        :account => nil
      )
    ])
  end

  it "renders a list of transactions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Libelle".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
