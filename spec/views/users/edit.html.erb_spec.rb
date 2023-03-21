require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!(
      first_name: "MyString",
      last_name: "MyString",
      adress: "MyString",
      zip_code: "MyString",
      city_name: "MyString",
      country: "MyString",
      phone: "MyString"
    )
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do

      assert_select "input[name=?]", "user[first_name]"

      assert_select "input[name=?]", "user[last_name]"

      assert_select "input[name=?]", "user[adress]"

      assert_select "input[name=?]", "user[zip_code]"

      assert_select "input[name=?]", "user[city_name]"

      assert_select "input[name=?]", "user[country]"

      assert_select "input[name=?]", "user[phone]"
    end
  end
end
