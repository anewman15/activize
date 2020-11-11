require 'rails_helper'

feature 'user group management features', type: :feature do
  feature 'creating group' do
    scenario 'failing when group name is absent' do
      create_user
      click_on 'Activity Groups', match: :first
      click_on 'Create a New Group'
      fill_in 'group_name', with: ''
      attach_file('group_icon', File.absolute_path('./public/no_group.png'))
      click_on 'Create Group'

      expect(page).to have_content("can't be blank")
    end

    scenario 'failing when group name is less than 3 characters' do
      create_user
      click_on 'Activity Groups', match: :first
      click_on 'Create a New Group'
      fill_in 'group_name', with: 'Ab'
      attach_file('group_icon', File.absolute_path('./public/no_group.png'))
      click_on 'Create Group'

      expect(page).to have_content("is too short (minimum is 3 characters)")
    end

    scenario 'failing when group name is more than 100 characters' do
      create_user
      click_on 'Activity Groups', match: :first
      click_on 'Create a New Group'
      fill_in 'group_name', with: 'Ali Babanin bir ciftligi var ciftligiginde kedileri var. Miyao Miyao diye bagirir. Ciftligiginde Ali Babanin'
      attach_file('group_icon', File.absolute_path('./public/no_group.png'))
      click_on 'Create Group'

      expect(page).to have_content("is too long (maximum is 100 characters)")
    end

    scenario 'failing when group icon is absent' do
      create_user
      click_on 'Activity Groups', match: :first
      click_on 'Create a New Group'
      fill_in 'group_name', with: 'A Test Group Name'
      click_on 'Create Group'

      expect(page).to have_content("can't be blank")
    end

    scenario 'successful with valid params' do
      create_user
      create_group

      expect(page).to have_content('New group created successfully!')
    end
  end

  scenario 'showing the list of groups created by the user' do
    create_user
    click_on 'Activity Groups', match: :first

    expect(page).to have_content('Create a New Group')
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
