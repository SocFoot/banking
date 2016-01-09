require 'rails_helper'

RSpec.describe "epargnes/new", type: :view do
  before(:each) do
    assign(:epargne, Epargne.new(
      :libelle => "MyString",
      :rate => "9.99",
      :user_id => 1
    ))
  end

  it "renders new epargne form" do
    render

    assert_select "form[action=?][method=?]", epargnes_path, "post" do

      assert_select "input#epargne_libelle[name=?]", "epargne[libelle]"

      assert_select "input#epargne_rate[name=?]", "epargne[rate]"

    end
  end
end
