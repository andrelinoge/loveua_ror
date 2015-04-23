When(/^I fill registration form with valid data$/) do
  visit('/')
  fill_in 'initial_registration_form[email]', with: 'email@mail.com'
  fill_in 'initial_registration_form[name]', with: 'user name'
  select '28', from: 'initial_registration_form[age]'
  choose 'initial_registration_form[gender]', option: User::MALE
  choose 'initial_registration_form[seek_gender]', option: User::FEMALE
  click_on 'Register'
end

Then(/^I should be registred in application$/) do
  expect(User.exists?(email: 'email@mail.com')).to be_truthy
end

Then(/^logged in$/) do
  expect(logged_in?).to be_truthy
end

Then(/^redirected to next step of registration$/) do
  pending # express the regexp above with the code you wish you had
end
