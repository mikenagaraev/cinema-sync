# This file is testing app/views/users/sessions/new.html.erb view
# Log in page

require 'rails_helper'

describe 'Log in page' do

  it 'swithes to sign up page when log in button is pressed' do

    visit "/users/sign_in"
    click_link "Sign Up"
    expect(current_path).to eq "/users/sign_up"

  end

end
