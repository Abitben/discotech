require 'rails_helper'

RSpec.describe "ads/index", type: :view do
  before(:each) do
    assign(:ads, [
      Ad.create!(
        price: "9.99",
        description: "MyText",
        status: 2,
        copy: nil
      ),
      Ad.create!(
        price: "9.99",
        description: "MyText",
        status: 2,
        copy: nil
      )
    ])
  end

  it "renders a list of ads" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
