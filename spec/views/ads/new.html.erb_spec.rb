require 'rails_helper'

RSpec.describe "ads/new", type: :view do
  before(:each) do
    assign(:ad, Ad.new(
      price: "9.99",
      description: "MyText",
      status: 1,
      copy: nil
    ))
  end

  it "renders new ad form" do
    render

    assert_select "form[action=?][method=?]", ads_path, "post" do

      assert_select "input[name=?]", "ad[price]"

      assert_select "textarea[name=?]", "ad[description]"

      assert_select "input[name=?]", "ad[status]"

      assert_select "input[name=?]", "ad[copy_id]"
    end
  end
end
