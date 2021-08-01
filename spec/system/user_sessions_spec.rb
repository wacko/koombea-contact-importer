require 'rails_helper'

RSpec.describe 'User sessions', type: :system do
  it 'sucessful sign up' do
    existing_users = User.count

    visit new_user_registration_url

    fill_in 'Email', with: 'new_user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(User.count).to eq(existing_users + 1)
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Sign out')
  end

  it 'login with an existing user' do
    User.create(email: 'login_user@example.com', password: 'password')

    visit new_user_session_url

    fill_in 'Email', with: 'login_user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(current_path).to eq(root_path)
    expect(page).to have_text('Sign out')
  end

  it 'reject login with invalid credentials' do
    visit new_user_session_url

    fill_in 'Email', with: 'other@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_text('Log in')
  end
end
