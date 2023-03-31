# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    assign(:user, User.create!(
                    first_name: 'First Name',
                    last_name: 'Last Name',
                    adress: 'Adress',
                    zip_code: 'Zip Code',
                    city_name: 'City Name',
                    country: 'Country',
                    phone: 'Phone'
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Adress/)
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/City Name/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Phone/)
  end
end
