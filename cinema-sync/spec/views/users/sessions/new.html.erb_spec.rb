# This file is testing app/views/users/sessions/new.html.erb view
# Log in page

require 'rails_helper'

describe 'Log in page' do

  it 'swithes to sign up page when log in button is pressed' do

    visit "/users/sign_in"
    click_link "Sign Up"
    expect(current_path).to eq "/users/sign_up"

  end

  it "should log in as a user" do

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
    click_link "Sign out"
    expect(current_path).to eq "/"
    click_link "Sign in"
    expect(current_path).to eq "/users/sign_in"
    fill_in('user_email', :with => 'tester@tester.by')
    fill_in('user_password', :with => 'test-pass')
    click_button "Log In"

    expect(current_path).to eq "/"
    expect(page).to have_content("Sign out")

  end

end
