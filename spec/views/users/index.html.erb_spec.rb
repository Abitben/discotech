# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               first_name: 'First Name',
               last_name: 'Last Name',
               adress: 'Adress',
               zip_code: 'Zip Code',
               city_name: 'City Name',
               country: 'Country',
               phone: 'Phone'
             ),
             User.create!(
               first_name: 'First Name',
               last_name: 'Last Name',
               adress: 'Adress',
               zip_code: 'Zip Code',
               city_name: 'City Name',
               country: 'Country',
               phone: 'Phone'
             )
           ])
  end

  it 'renders a list of users' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('First Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Last Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Adress'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Zip Code'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('City Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Country'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Phone'.to_s), count: 2
  end
end
