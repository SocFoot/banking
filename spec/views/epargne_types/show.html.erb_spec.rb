require 'rails_helper'

RSpec.describe "epargne_types/show", type: :view do
  before(:each) do
    @epargne_type = assign(:epargne_type, EpargneType.create!(
      :nom => "Nom",
      :epargne_id => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
  end
end
