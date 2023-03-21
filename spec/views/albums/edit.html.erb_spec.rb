require 'rails_helper'

RSpec.describe "albums/edit", type: :view do
  let(:album) {
    Album.create!(
      title: "MyString",
      artist: "MyString",
      year: 1,
      price: "9.99"
    )
  }

  before(:each) do
    assign(:album, album)
  end

  it "renders the edit album form" do
    render

    assert_select "form[action=?][method=?]", album_path(album), "post" do

      assert_select "input[name=?]", "album[title]"

      assert_select "input[name=?]", "album[artist]"

      assert_select "input[name=?]", "album[year]"

      assert_select "input[name=?]", "album[price]"
    end
  end
end
