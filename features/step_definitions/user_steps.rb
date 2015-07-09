USER_EMAIL = 'user@mail.com'
USER_PASSWORD = '123456'

Given(/^I am a guest$/) do
  
end

Given(/^I am a user$/) do
  FactoryGirl.create(:user, email: USER_EMAIL, password: USER_PASSWORD)

  visit('/')
  click_on 'Login'
  fill_in 'email', with: USER_EMAIL
  fill_in 'password', with: USER_PASSWORD
  click_on 'Log in'
end