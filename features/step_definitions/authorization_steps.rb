USER_EMAIL = 'user@mail.com'
USER_PASSWORD = '123456'
USER_WRONG_PASSWORD = 'abc'

When(/^I enter valid credentials and click log in button$/) do
  FactoryGirl.create(:user, email: USER_EMAIL, password: USER_PASSWORD)

  visit('/')
  click_on 'Login'
  fill_in 'email', with: USER_EMAIL
  fill_in 'password', with: USER_PASSWORD
  click_on 'Log in'
end

Then(/^I should be logged in$/) do
  user = User.find_by_email USER_EMAIL
  expect(page).to have_content user.name
  expect(page).to have_content 'Log out'
end 

Then(/^redirected to profile page$/) do
  expect(page).to have_content 'Your profile'
end

When(/^I enter invalid credentials and click log in button$/) do
  FactoryGirl.create(:user, email: USER_EMAIL, password: USER_PASSWORD)

  visit('/')
  click_on 'Login'
  fill_in 'email', with: USER_EMAIL
  fill_in 'password', with: USER_WRONG_PASSWORD
  click_on 'Log in'
end

Then(/^I should see authorization error messages$/) do
  sleep 2
  expect(page).to have_content 'wrong email or password'
end