# This file is testing app/views/rooms/_add_video_popup.html.erb view
# Add video modal

require 'rails_helper'

describe 'Modal to add video' do

  it 'should add video to the room' do

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
    find('#add-video-to-room').click

    within('#add-video-pop-up') do
      expect(page).to have_content('Add video')
      fill_in('room_video_title', :with => 'Video name')
      fill_in('room_video_url', :with => 'https://www.youtube.com/watch?v=UYDPoxbvkWM')
      click_button "Add"
    end

    expect(page).to have_content('Video name')

  end

end
