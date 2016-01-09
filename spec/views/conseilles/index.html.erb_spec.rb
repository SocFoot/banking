require 'rails_helper'

RSpec.describe "conseilles/index", type: :view do
  before(:each) do
    assign(:conseilles, [
      Conseille.create!(
        :nom => "Nom",
        :prenom => "Prenom",
        :user_id => 4,
        :account_id => 3,
        :transaction_id => 2,
        :litige_id => 1
      ),
      Conseille.create!(
        :nom => "Nom",
        :prenom => "Prenom",
        :user_id => 4,
        :account_id => 3,
        :transaction_id => 2,
        :litige_id => 1
      )
    ])
  end

  it "renders a list of conseilles" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Prenom".to_s, :count => 2
  end
end
