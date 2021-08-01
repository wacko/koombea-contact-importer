module SystemTestHelper
  def login(user = nil, password: '123456')
    user ||= users(:user)
    visit new_user_session_url
    fill_in 'Email', with: user.email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end
