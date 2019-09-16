require 'spec_helper'
require 'rails_helper'

feature 'Visitor sign in' do
  scenario 'with valid email and password' do
    User.create(email: 'valid@example.com', password: 'password')
    sign_in_with 'valid@example.com', 'password'

    expect(page).to have_content('Signed in successfully')
  end

  scenario 'with invalid email' do
    sign_in_with 'invalid_email', 'password'

    expect(page).to have_content('Log in')
  end

  scenario 'with blank password' do
    sign_in_with 'valid@example.com', ''

    expect(page).to have_content('Log in')
  end

  def sign_in_with(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end
