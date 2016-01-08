require 'rails_helper'

RSpec.describe "epargnes/edit", type: :view do
  before(:each) do
    @epargne = assign(:epargne, Epargne.create!(
      :style => "MyString",
      :libelle => "MyString",
      :rate => "9.99",
      :user_id => 5
    ))
  end

  it "renders the edit epargne form" do
    render

    assert_select "form[action=?][method=?]", epargne_path(@epargne), "post" do

      assert_select "input#epargne_style[name=?]", "epargne[style]"

      assert_select "input#epargne_libelle[name=?]", "epargne[libelle]"

      assert_select "input#epargne_rate[name=?]", "epargne[rate]"

    end
  end
end
