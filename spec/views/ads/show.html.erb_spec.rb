require 'rails_helper'

RSpec.describe "ads/show", type: :view do
  before(:each) do
    assign(:ad, Ad.create!(
      price: "9.99",
      description: "MyText",
      status: 2,
      copy: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
