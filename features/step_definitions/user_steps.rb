USER_EMAIL    = 'user@mail.com'
USER_PASSWORD = '123456'

Given /^I am a guest$/ do
  
end

Given /^I am a user$/ do
  FactoryGirl.create(:user, email: USER_EMAIL, password: USER_PASSWORD)

  visit('/')
  click_on 'Login'
  fill_in 'session_email', with: USER_EMAIL
  fill_in 'session_password', with: USER_PASSWORD
  click_on 'Log in'
  sleep(2)
end