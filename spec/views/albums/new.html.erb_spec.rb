require 'rails_helper'

RSpec.describe "albums/new", type: :view do
  before(:each) do
    assign(:album, Album.new(
      title: "MyString",
      artist: "MyString",
      year: 1,
      price: "9.99"
    ))
  end

  it "renders new album form" do
    render

    assert_select "form[action=?][method=?]", albums_path, "post" do

      assert_select "input[name=?]", "album[title]"

      assert_select "input[name=?]", "album[artist]"

      assert_select "input[name=?]", "album[year]"

      assert_select "input[name=?]", "album[price]"
    end
  end
end
