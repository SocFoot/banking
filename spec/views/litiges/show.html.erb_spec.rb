require 'rails_helper'

RSpec.describe "litiges/show", type: :view do
  before(:each) do
    @litige = assign(:litige, Litige.create!(
      :identifiant => "ER012",
      :status => "Status",
      :motif => "Motif",
      :transaction_id => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Identifiant/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Motif/)
    expect(rendered).to match(//)
  end
end
