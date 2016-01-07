require 'rails_helper'

RSpec.describe "accounts/show", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :zip => 1111111111111111,
      :libelle => "Libelle"
    ))
  end
  
  
  it "renders attributes in <p>" do
    render partial: "/partial/account", locals: {account:@account}
    expect(rendered).to match(/1111111111111111/)
    expect(rendered).to match(/Libelle/)
  end
end
