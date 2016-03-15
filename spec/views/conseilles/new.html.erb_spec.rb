require 'rails_helper'

RSpec.describe "conseilles/new", type: :view do
  before(:each) do
    assign(:conseille, Conseille.new(
      :nom => "MyString",
      :prenom => "MyString"
    ))
    @user_ids = User.all.collect { |p| [ p.id ] }  
    @account_ids = Account.all.collect { |p| [ p.id ] }
    @transaction_ids = Transaction.all.collect { |p| [ p.id ] }
    @litige_ids = Litige.all.collect { |p| [ p.id ] }
  end

  it "renders new conseille form" do
    render

    assert_select "form[action=?][method=?]", conseilles_path, "post" do

      assert_select "input#conseille_nom[name=?]", "conseille[nom]"

      assert_select "input#conseille_prenom[name=?]", "conseille[prenom]"

    end
  end
end
