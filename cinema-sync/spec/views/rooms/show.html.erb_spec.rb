# This file is testing app/views/rooms/show.html.erb view
# Chat test

require 'rails_helper'

describe 'Chat' do

  it 'should send messages and reload its state' do

    visit "/"

    click_link "Sign up"
    expect(current_path).to eq "/users/sign_up"
    fill_in('user_username', :with => 'CoolGuy')
    fill_in('user_email', :with => 'tester@tester.by')
    fill_in('user_password', :with => 'test-pass')
    fill_in('user_password_confirmation', :with => 'test-pass')
    click_button "Get Started"

    expect(current_path).to eq "/"
    find('button.button-create').click

    within('#create-room-pop-up') do
      expect(page).to have_content('New Room')
      fill_in('room_title', :with => 'My room')
      click_button "Create"
    end

    expect(page).to have_content('My room')
    room_path = current_path
    fill_in('message_body', :with => 'Hello, World!')
    click_button "Send"

    visit room_path

    expect(page).to have_content('Hello, World!')
    expect(page).to have_css('div.chat-box')

  end

  it 'should not send empty messages' do

    visit "/"

    click_link "Sign up"
    expect(current_path).to eq "/users/sign_up"
    fill_in('user_username', :with => 'CoolGuy')
    fill_in('user_email', :with => 'tester@tester.by')
    fill_in('user_password', :with => 'test-pass')
    fill_in('user_password_confirmation', :with => 'test-pass')
    click_button "Get Started"

    expect(current_path).to eq "/"
    find('button.button-create').click

    within('#create-room-pop-up') do
      expect(page).to have_content('New Room')
      fill_in('room_title', :with => 'My room')
      click_button "Create"
    end

    expect(page).to have_content('My room')
    room_path = current_path
    fill_in('message_body', :with => '')
    click_button "Send"

    visit room_path

    expect(page).not_to have_css('div.chat-box')

  end

end
