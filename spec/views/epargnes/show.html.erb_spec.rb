require 'rails_helper'

RSpec.describe "epargnes/show", type: :view do
  before(:each) do
    @epargne = assign(:epargne, Epargne.create!(
      :style => "Style",
      :libelle => "Libelle",
      :rate => "9.99",
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Style/)
    expect(rendered).to match(/Libelle/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
