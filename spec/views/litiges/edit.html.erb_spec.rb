require 'rails_helper'

RSpec.describe "litiges/edit", type: :view do
  before(:each) do
    @litige = assign(:litige, Litige.create!(
      :identifiant => "ER012",
      :status => "MyString",
      :motif => "MyString",
      :transaction_id => nil
    ))
    
    @status =  [["Nouveau"], ["en cours de traitement"], ["traité"]]
  end

  it "renders the edit litige form" do
    render

    assert_select "form[action=?][method=?]", litige_path(@litige), "post" do

      assert_select "input#litige_identifiant[name=?]", "litige[identifiant]"

      assert_select "select#litige_status[name=?]", "litige[status]"

      assert_select "input#litige_motif[name=?]", "litige[motif]"

    end
  end
end
