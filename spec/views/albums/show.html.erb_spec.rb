require 'rails_helper'

RSpec.describe "albums/show", type: :view do
  before(:each) do
    assign(:album, Album.create!(
      title: "Title",
      artist: "Artist",
      year: 2,
      price: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Artist/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
  end
end
