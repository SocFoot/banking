require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      :in => 1,
      :out => 1,
      :libelle => "MyString",
      :account_id => 1
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input#transaction_in[name=?]", "transaction[in]"

      assert_select "input#transaction_out[name=?]", "transaction[out]"

      assert_select "input#transaction_libelle[name=?]", "transaction[libelle]"


    end
  end
end
