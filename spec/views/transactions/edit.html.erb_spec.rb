require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :in => 1,
      :out => 1,
      :libelle => "MyString",
      :account_id => 1
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input#transaction_in[name=?]", "transaction[in]"

      assert_select "input#transaction_out[name=?]", "transaction[out]"

      assert_select "input#transaction_libelle[name=?]", "transaction[libelle]"


    end
  end
end
