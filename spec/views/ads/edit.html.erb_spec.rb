require 'rails_helper'

RSpec.describe "ads/edit", type: :view do
  let(:ad) {
    Ad.create!(
      price: "9.99",
      description: "MyText",
      status: 1,
      copy: nil
    )
  }

  before(:each) do
    assign(:ad, ad)
  end

  it "renders the edit ad form" do
    render

    assert_select "form[action=?][method=?]", ad_path(ad), "post" do

      assert_select "input[name=?]", "ad[price]"

      assert_select "textarea[name=?]", "ad[description]"

      assert_select "input[name=?]", "ad[status]"

      assert_select "input[name=?]", "ad[copy_id]"
    end
  end
end
