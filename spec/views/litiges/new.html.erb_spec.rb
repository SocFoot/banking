require 'rails_helper'

RSpec.describe "litiges/new", type: :view do
  before(:each) do
    assign(:litige, Litige.new(
      :identifiant => "ER012",
      :status => "MyString",
      :motif => "MyString",
      :transaction_id => nil
    ))
    @status = [["Nouveau"], ["en cours de traitement"], ["traité"]]
  end

  it "renders new litige form" do
    render

    assert_select "form[action=?][method=?]", litiges_path, "post" do

      assert_select "input#litige_identifiant[name=?]", "litige[identifiant]"

      assert_select "select#litige_status[name=?]", "litige[status]"

      assert_select "input#litige_motif[name=?]", "litige[motif]"


    end
  end
end
