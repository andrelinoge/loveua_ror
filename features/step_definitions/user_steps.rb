Given /^I am a guest$/ do
  
end

Given /^I am a user$/ do
  FactoryGirl.create(:user, email: 'user@mail.com', password: '123456')

  visit('/')
  click_on 'Login'
  fill_in 'session_email', with: 'user@mail.com'
  fill_in 'session_password', with: '123456'
  click_on 'Log in'
  sleep(2)
end