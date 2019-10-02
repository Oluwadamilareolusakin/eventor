require 'rails_helper'

feature 'User management' do
  background do
    @user = FactoryBot.create(:user)
  end

  scenario 'User logs in with valid details' do
    visit login_path

    fill_in "session[email]", with: @user.email

    click_button('Login')
    expect(page).to have_content("Welcome")
  end

  scenario 'User logs in with invalid details' do
    visit login_path

    fill_in "session[email]", with: 'another@email.com'

    click_button('Login')
    expect(page).to have_content("Please check your email and try again")
  end

  scenario 'sign up with valid details' do
    visit signup_path

    fill_in "user[name]", with: 'A name'
    fill_in "user[username]", with: 'Username'
    fill_in "user[email]", with: 'example@example.com'

    click_button 'Sign up'
    expect(page).to have_content("Welcome")
  end

  scenario 'sign up with invalid details' do
    visit signup_path

    fill_in "user[name]", with: 'A name'
    fill_in "user[username]", with: 'Username'
    fill_in "user[email]", with: nil

    click_button 'Sign up'
    expect(page).to have_content("Email can't")
  end
end

