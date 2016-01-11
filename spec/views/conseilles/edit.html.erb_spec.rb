require 'rails_helper'

RSpec.describe "conseilles/edit", type: :view do
  before(:each) do
    @conseille = assign(:conseille, Conseille.create!(
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

  it "renders the edit conseille form" do
    render

    assert_select "form[action=?][method=?]", conseille_path(@conseille), "post" do

      assert_select "select#conseille_user_id[name=?]", "conseille[user_id]"

      assert_select "select#conseille_account_id[name=?]", "conseille[account_id]"

    end
  end
end
