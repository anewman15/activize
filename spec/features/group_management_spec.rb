require 'rails_helper'

feature 'user group management features', type: :feature do
  feature 'creating group' do
    scenario 'failing with invalid params' do
      create_user
      click_on 'Activity Groups'
      click_on 'Create a New Group'
      fill_in 'group_name', with: 'A Test Group Name'
      click_on 'Create Group'

      # expect(current_path).to eq('/users/1/activities')
      expect(page).to have_content("can't be blank")
    end

    # scenario 'successful with valid params' do
    #   create_user
    #   create_group

    #   expect(current_path).to eq('/users/1')
    #   expect(page).to have_content('New group created successfully!')
    # end
  end

  scenario 'showing the list of groups created by the user' do
    create_user
    click_on 'Activity Groups'

    expect(page).to have_content('Create a New Group')
  end

  def create_group
    click_on 'Activity Groups'
    click_on 'Create a New Group'
    fill_in 'group_name', with: 'A Test Group Name'
    fill_in 'grou_icon', with: attach_file('ok', File.absolute_path('./public/no_group.png'))
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
