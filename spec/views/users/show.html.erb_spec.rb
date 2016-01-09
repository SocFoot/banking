require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :nom => "foo",
      :prenom => "Prenom",
      :sexe => "Sexe",
      :adresse => "Adresse",
      :password_digest => "3210"
    ))

    @account = assign(:account, Account.create!(
      :zip => 1111111111111111,
      :libelle => "Libelle",
      :user_id => @user.id
    ))
    @users = User.all
    @accounts = Account.all
    @transactions = Transaction.all
    @litiges = Litige.all
    @epargnes = Epargne.all
    @conseilles = Conseille.all
  end

  it "renders attributes in <p>" do
    render

  end
end
