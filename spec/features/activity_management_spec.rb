require 'rails_helper'

feature 'user activty management features', type: :feature do
  feature 'creating an activity' do
    scenario 'failing with a name absent' do
      create_user
      click_on 'All Activities', match: :first
      click_on 'Create a New Activity'
      fill_in 'activity_amount', with: 15
      click_on 'Create Activity'

      expect(page).to have_content("can't be blank")
    end

    scenario 'failing with a name with less than 3 characters' do
      create_user
      click_on 'All Activities', match: :first
      click_on 'Create a New Activity'
      fill_in 'activity_name', with: 'AT'
      fill_in 'activity_amount', with: 15
      click_on 'Create Activity'

      expect(page).to have_content("is too short (minimum is 3 characters)")
    end

    scenario 'failing with a name with more than 500 characters' do
      create_user
      click_on 'All Activities', match: :first
      click_on 'Create a New Activity'
      fill_in 'activity_name', with: "There is another formatting option rspec --format documentation that
        goes through each test one by one. My question: how can I enable --format documentation by default
        without having to type it in the command line every time? There is another formatting option rspec
        --format documentation that goes through each test one by one. My question: how can I enable --format
        documentation by default without having to type it in the command line every time? There is another
        formatting option rspec --format documentation that goes through each test one by one. My question:
        how can I enable --format documentation by default without having to type it in the command line every time?"
      fill_in 'activity_amount', with: 15
      click_on 'Create Activity'

      expect(page).to have_content("is too long (maximum is 500 characters)")
    end

    scenario 'failing with an amount given' do
      create_user
      click_on 'All Activities', match: :first
      click_on 'Create a New Activity'
      fill_in 'activity_name', with: 'A Test Activity Name'
      click_on 'Create Activity'

      expect(page).to have_content("can't be blank")
    end

    scenario 'successful with valid params' do
      create_user
      create_activity

      expect(page).to have_content('New activity created successfully!')
    end
  end

  feature 'showing the list of' do
    scenario 'activities created by the user' do
      create_user
      click_on 'All Activities', match: :first

      expect(page).to have_content('All Activities')
    end

    scenario 'ungrouped activities created by the user' do
      create_user
      click_on 'Ungrouped Activities', match: :first

      expect(page).to have_content('Your Ungrouped Activities')
    end
  end

  def create_activity
    click_on 'All Activities', match: :first
    click_on 'Create a New Activity'
    fill_in 'activity_name', with: 'A Test Activity Name'
    fill_in 'activity_amount', with: 100
    click_on 'Create Activity'
  end


  def create_group
    click_on 'Activity Groups', match: :first
    click_on 'Create a New Group'
    fill_in 'group_name', with: 'A Test Group Name'
    attach_file('group_icon', File.absolute_path('./public/no_group.png'))
    click_on 'Create Group'
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
