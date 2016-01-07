require 'rails_helper'

RSpec.describe "accounts/edit", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :zip => 1111111111111111,
      :libelle => "MyString"
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input#account_zip[name=?]", "account[zip]"

      assert_select "input#account_libelle[name=?]", "account[libelle]"
    end
  end
end
