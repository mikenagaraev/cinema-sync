# This file is testing app/views/rooms/edit.html.erb view
# Edit room

require 'rails_helper'

describe 'Edit room dialog' do

  it 'should change room\'s preferences' do
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

    click_link "Edit"
    expect(page).to have_css('form.edit_room')
    expect(page).to have_content('Video url:')
    fill_in('room_video_title', :with => 'Video new name')
    fill_in('room_video_url', :with => 'https://www.youtube.com/watch?v=y1EKHqSfmS4')
    find('input.edit-room-form-button').click

    expect(page).to have_content('Video new name')
  end
end
