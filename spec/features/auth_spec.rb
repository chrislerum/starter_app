require 'rails_helper'

feature "User registration" do
  before do
    @first_name, @last_name, @password = 'Henry', 'Talbot', 'happyface'
  end

  scenario "User signs up for account and is automatically signed in", js: true do
    visit root_path
    within '.navbar' do
      click_link 'Sign Up'
    end
    expect(page).to have_content 'Password Confirmation'
    fill_in 'First Name', with: @first_name
    fill_in 'Last Name', with: @last_name
    the_now = (Date.today - 30.years)
    fill_in 'Email Address', with: 'hellothere@gmail.com'
    within '#password' do
      fill_in 'user_password', with: @password
    end
    within '#password_confirmation' do
      fill_in 'user_password', with: @password
    end
    click_button 'Sign up'

    expect(page).to have_content 'You have signed up successfully.'
    expect(page).to have_content "#{@first_name} #{@last_name}"
    within '.navbar' do
      expect(page).to have_link 'Sign Out'
    end
  end

  scenario "User signs in to account and sees his name", js: true do
    user = signed_up_user(password: @password)
    sign_out_user
    visit root_path
    within '.navbar' do
      click_link 'Sign In'
    end
    fill_in 'Email Address', with: user.email
    within '#password' do
      fill_in 'user_password', with: @password
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  end
end
