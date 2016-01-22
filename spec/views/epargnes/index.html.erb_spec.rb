require 'rails_helper'

RSpec.describe "epargnes/index", type: :view do
  before(:each) do
    @user = create(:user)
    @user.epargnes.build({rate:"9.99".to_s, libelle:"Libelle"}).save
    @epargnes = @user.epargnes
  end

  it "renders a list of epargnes" do
    render
    assert_select "tr>td", :text => "Libelle".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => @user.nom, :count => 2
  end
end
