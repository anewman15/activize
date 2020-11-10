require 'rails_helper'

feature 'user authenticaiton features', type: :feature do
  feature 'signing up a user' do
    scenario 'failing with invalid params' do
      visit '/users/sign_up'
      fill_in 'user_name', with: 'Abdulllah Numan'
      click_on 'Sign up'

      expect(current_path).to eq('/users')
      expect(page).to have_content("can't be blank")
    end

    scenario 'successful with valid params' do
      create_user

      # expect(current_path).to eq('/users/1')
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end

  feature 'signing in a user' do
    scenario 'failing with invalid params' do
      create_user
      click_on 'Logout'
      visit '/users/sign_in'
      fill_in 'user_name', with: 'Abdullah Numan'
      click_on 'Log in'

      expect(current_path).to eq('/users/sign_in')
      expect(page).to have_content('Invalid Name or password.')
    end

    scenario 'successful with valid params' do
      create_user
      click_on 'Logout'
      fill_in 'user_name', with: 'Abdullah Bangali'
      fill_in 'user_password', with: '12345678'
      click_on 'Log in'

      # expect(current_path).to eq('/users/1')
      expect(page).to have_content('Signed in successfully.')
    end
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
