require 'rails_helper'

RSpec.describe "conseilles/edit", type: :view do
  before(:each) do
    @conseille = assign(:conseille, Conseille.create!(
      :nom => "MyString",
      :prenom => "MyString"
    ))
    @user_ids = User.all.collect { |p| [ p.id ] }  
    @account_ids = Account.all.collect { |p| [ p.id ] }
    @transaction_ids = Transaction.all.collect { |p| [ p.id ] }
    @litige_ids = Litige.all.collect { |p| [ p.id ] }
  end

  it "renders the edit conseille form" do
    render

    assert_select "form[action=?][method=?]", conseille_path(@conseille), "post" do

      assert_select "input#conseille_nom[name=?]", "conseille[nom]"

      assert_select "input#conseille_prenom[name=?]", "conseille[prenom]"

    end
  end
end
