require 'rails_helper'

RSpec.describe "epargne_types/new", type: :view do
  before(:each) do
    assign(:epargne_type, EpargneType.new(
      :nom => "MyString",
      :epargne_id => 5
    ))
    @epargne_collect = [[]]
  end

  it "renders new epargne_type form" do
    render

    assert_select "form[action=?][method=?]", epargne_types_path, "post" do

      assert_select "input#epargne_type_nom[name=?]", "epargne_type[nom]"

      assert_select "select#epargne_type_epargne_id[name=?]", "epargne_type[epargne_id]"
    end
  end
end
