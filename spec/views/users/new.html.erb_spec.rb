require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      first_name: "MyString",
      last_name: "MyString",
      adress: "MyString",
      zip_code: "MyString",
      city_name: "MyString",
      country: "MyString",
      phone: "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

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
