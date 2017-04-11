# This file is testing app/views/users/registrations/new.html.erb view
# Sign up page

require 'rails_helper'

describe 'Sing up page' do

  it 'swithes to log in page when log in button is pressed' do

    visit "/users/sign_up"
    click_link "Log in"
    expect(current_path).to eq "/users/sign_in"

  end

  it "should create a new user and log in as it" do

    visit "/"

    click_link "Sign up"
    expect(current_path).to eq "/users/sign_up"
    fill_in('user_username', :with => 'CoolGuy')
    fill_in('user_email', :with => 'tester@tester.by')
    fill_in('user_password', :with => 'test-pass')
    fill_in('user_password_confirmation', :with => 'test-pass')
    click_button "Get Started"

    expect(current_path).to eq "/"
    expect(page).to have_content("Sign out")
    
  end

end
