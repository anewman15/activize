require 'rails_helper'

feature 'user activty management features', type: :feature do
  feature 'creating an activity' do
    scenario 'failing with invalid params' do
      create_user
      click_on 'All Activities'
      click_on 'Create a New Activity'
      fill_in 'activity_name', with: 'A Test Activity Name'
      click_on 'Create Activity'

      # expect(current_path).to eq('/users/1/activities')
      expect(page).to have_content("can't be blank")
    end

    scenario 'successful with valid params' do
      create_user
      create_activity

      # expect(current_path).to eq('/users/1')
      expect(page).to have_content('New activity created successfully!')
    end
  end

  scenario 'showing the list of all activities created by the user' do
    create_user
    click_on 'All Activities'

    expect(page).to have_content("All Activities")
  end

  scenario 'showing the list of ungrouped activities created by the user' do
    create_user
    click_on 'Ungrouped Activities'

    expect(page).to have_content("Your Ungrouped Activities")
  end

  def create_activity
    click_on 'All Activities'
    click_on 'Create a New Activity'
    fill_in 'activity_name', with: 'A Test Activity Name'
    fill_in 'activity_amount', with: 100
    click_on 'Create Activity'
  end

  def create_user
    visit '/users/sign_up'
    fill_in 'user_name', with: 'Abdullah Bangali'
    fill_in 'user_email', with: 'aanuman15@hotmail.com'
    fill_in 'user_password', with: '12345678'
    fill_in 'user_password_confirmation', with: '12345678'
    click_on 'Sign up'
  end
end
