require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  before(:each) do
    assign(:account, Account.new(
      :zip => 1,
      :libelle => "MyString"
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input#account_zip[name=?]", "account[zip]"

      assert_select "input#account_libelle[name=?]", "account[libelle]"
    end
  end
end
