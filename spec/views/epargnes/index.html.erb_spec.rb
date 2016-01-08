require 'rails_helper'

RSpec.describe "epargnes/index", type: :view do
  before(:each) do
    assign(:epargnes, [
      Epargne.create!(
        :style => "Style",
        :libelle => "Libelle",
        :rate => "9.99",
        :user_id => 1
      ),
      Epargne.create!(
        :style => "Style",
        :libelle => "Libelle",
        :rate => "9.99",
        :user_id => 1
      )
    ])
  end

  it "renders a list of epargnes" do
    render
    assert_select "tr>td", :text => "Style".to_s, :count => 2
    assert_select "tr>td", :text => "Libelle".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
