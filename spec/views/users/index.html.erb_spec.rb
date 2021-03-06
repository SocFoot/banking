require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      create(:user),create(:user)
    ])
  end

  it "renders a list of users" do
    render
  
    assert_select "tr>td", :text => "h".to_s, :count => 2
    assert_select "tr>td", :text => "7 rue".to_s, :count => 2
  end
end
