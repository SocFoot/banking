require 'rails_helper'

RSpec.describe "conseilles/new", type: :view do
  before(:each) do
    assign(:conseille, Conseille.new(
      :nom => "MyString",
      :prenom => "MyString",
      :user_id => 4,
      :account_id => 3,
      :transaction_id => 2,
      :litige_id => 1
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

      assert_select "select#conseille_user_id[name=?]", "conseille[user_id]"

      assert_select "select#conseille_account_id[name=?]", "conseille[account_id]"

      assert_select "select#conseille_transaction_id[name=?]", "conseille[transaction_id]"

      assert_select "select#conseille_litige_id[name=?]", "conseille[litige_id]"
    end
  end
end
