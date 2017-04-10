# This file is testing app/views/users/registrations/new.html.erb view
# Sign up page

require 'rails_helper'

describe 'Sing up page' do

  it 'swithes to log in page when log in button is pressed' do

    visit "/users/sign_up"
    click_link "Log in"
    expect(current_path).to eq "/users/sign_in"

  end

end
