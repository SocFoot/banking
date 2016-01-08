require 'rails_helper'

RSpec.describe "epargne_types/edit", type: :view do
  before(:each) do
    @epargne_type = assign(:epargne_type, EpargneType.create!(
      :nom => "MyString",
      :epargne_id => 1
    ))
    
    @epargne_collect = [[]]
  end

  it "renders the edit epargne_type form" do
    render

    assert_select "form[action=?][method=?]", epargne_type_path(@epargne_type), "post" do

      assert_select "input#epargne_type_nom[name=?]", "epargne_type[nom]"

      assert_select "select#epargne_type_epargne_id[name=?]", "epargne_type[epargne_id]"
    end
  end
end
