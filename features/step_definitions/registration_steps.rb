When /^I fill registration form with valid data$/ do
  visit('/')
  fill_in 'initial_registration_form[email]', with: 'email@mail.com'
  fill_in 'initial_registration_form[name]', with: 'user_name'
  select '28', from: 'initial_registration_form[age]'
  choose 'initial_registration_form[gender]', option: User::MALE
  choose 'initial_registration_form[seek_gender]', option: User::FEMALE
  click_on 'Register'
end

Then /^I should be registred in application$/ do
  sleep 2
  expect(User.exists?(email: 'email@mail.com')).to be_truthy
end

Then /^redirected to next step of registration$/ do
  expect(page).to have_content 'Complete registration'
end

Then /^logged in$/ do
  expect(page).to have_content 'Log out'
end

When /^I fill registration form with invalid data$/ do
  visit('/')
  fill_in 'initial_registration_form[email]', with: 'email#mail.com'
  fill_in 'initial_registration_form[name]', with: ''
  select '28', from: 'initial_registration_form[age]'
  choose 'initial_registration_form[gender]', option: User::MALE
  choose 'initial_registration_form[seek_gender]', option: User::FEMALE
  click_on 'Register'
end

Then /^I should see validation errors$/ do
  sleep 2
  expect(page).to have_content "Can't be blank"
end

Then /^stay on the same page$/ do
  expect(page).to have_content 'Registration'
end

Given /^I am on complete registration page$/ do
  visit(complete_registration_path)
  expect(page).to have_content 'Complete registration'
end

When /^$I fill my personal data and click save/ do
  pending
end

Then /^my profile is updated successfully$/ do
  pending
end

When /^$I fill my questionary data and click save/ do
  pending
end

Then /^$my questionary data is updated successfully/ do
  pending
end